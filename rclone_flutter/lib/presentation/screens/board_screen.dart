import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rclone_flutter/presentation/cubits/color_cubit/color_cubit.dart';
import 'package:rclone_flutter/presentation/cubits/pixels_cubit/pixels_cubit.dart';
import 'package:rclone_flutter/presentation/screens/loading_screen.dart';
import 'package:rclone_flutter/presentation/screens/select_username_screen.dart';
import 'package:rclone_flutter/presentation/widgets/board_painter.dart';
import 'package:rclone_flutter/presentation/widgets/color_picker.dart';

class BoardScreen extends StatelessWidget {
  const BoardScreen({
    super.key,
    this.userWatching = false,
  });

  final bool userWatching;

  bool isMobile(BuildContext context) =>
      Theme.of(context).platform == TargetPlatform.android ||
      Theme.of(context).platform == TargetPlatform.iOS;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PixelsCubit, PixelsState>(
      builder: (context, state) {
        return switch (state) {
          PixelsLoading() => LoadingScreen(),
          (final PixelsLoaded state) => Scaffold(
              backgroundColor: Color(0xFF313338),
              appBar: userWatching
                  ? AppBar(
                      title: Text(context.read<PixelsCubit>().username),
                    )
                  : AppBar(
                      backgroundColor: Color(0xFF313338),
                      actions: [
                        ColorPicker(),
                      ],
                    ),
              body: Center(
                child: InteractiveViewer(
                  constrained: false,
                  minScale: 0.2,
                  maxScale: 15,
                  boundaryMargin: EdgeInsets.all(double.infinity),
                  transformationController:
                      context.read<PixelsCubit>().viewTransformationController,
                  child: Container(
                    width: 1920,
                    height: 1080,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Listener(
                      onPointerDown: userWatching
                          ? null
                          : (event) {
                              if (isMobile(context) ||
                                  HardwareKeyboard
                                      .instance.physicalKeysPressed.isEmpty) {
                                final color = context.read<ColorCubit>().state;
                                context.read<PixelsCubit>().writePixel(
                                      event.localPosition,
                                      color,
                                    );
                              }
                            },
                      child: CustomPaint(
                        size: const Size(1920, 1080),
                        painter: BoardPainter(
                          pixels: state.pixels,
                        ),
                      ),
                    ),
                  ),
                ),
              )),
          PixelsInitial() =>
            userWatching ? LoadingScreen() : SelectUsernameScreen(),
        };
      },
    );
  }
}
