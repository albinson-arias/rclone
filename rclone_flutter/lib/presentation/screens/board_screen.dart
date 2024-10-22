import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rclone_flutter/presentation/cubits/color_cubit/color_cubit.dart';
import 'package:rclone_flutter/presentation/cubits/pixels_cubit/pixels_cubit.dart';
import 'package:rclone_flutter/presentation/widgets/board_painter.dart';
import 'package:rclone_flutter/presentation/widgets/color_picker.dart';

class BoardScreen extends StatelessWidget {
  const BoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          ColorPicker(),
        ],
      ),
      body: BlocBuilder<PixelsCubit, PixelsState>(
        builder: (context, state) {
          return switch (state) {
            PixelsLoading() =>
              const Center(child: CircularProgressIndicator.adaptive()),
            (final PixelsLoaded state) => InteractiveViewer(
                constrained: false,
                minScale: 0.2,
                maxScale: 15,
                child: SizedBox(
                  width: 1920,
                  height: 1080,
                  child: Listener(
                    onPointerDown: (event) {
                      if (HardwareKeyboard
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
          };
        },
      ),
    );
  }
}
