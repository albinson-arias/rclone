import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:rclone_flutter/presentation/cubits/color_cubit/color_cubit.dart';

class ColorPicker extends StatelessWidget {
  ColorPicker({super.key});

  final List<Color> _defaultColors = [
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.deepPurple,
    Colors.indigo,
    Colors.blue,
    Colors.lightBlue,
    Colors.cyan,
    Colors.teal,
    Colors.green,
    Colors.lightGreen,
    Colors.lime,
    Colors.yellow,
    Color(0xFFFFD9C2),
    Colors.amber,
    Colors.orange,
    Colors.deepOrange,
    Colors.brown,
    Colors.grey,
    Colors.blueGrey,
    Colors.black,
    Colors.white,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorCubit, Color>(
      builder: (context, color) {
        return Flexible(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: BlockPicker(
              pickerColor: color,
              availableColors: _defaultColors,
              onColorChanged: context.read<ColorCubit>().changeColor,
              itemBuilder: (color, isCurrentColor, changeColor) {
                return Container(
                  margin: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color,
                    border: Border.all(
                      width: 2,
                    ),
                    // boxShadow: [
                    //   BoxShadow(
                    //       color: color.withOpacity(0.8),
                    //       offset: const Offset(1, 2),
                    //       blurRadius: 5)
                    // ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: changeColor,
                      borderRadius: BorderRadius.circular(50),
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 210),
                        opacity: isCurrentColor ? 1 : 0,
                        child: Icon(Icons.done,
                            color: useWhiteForeground(color)
                                ? Colors.white
                                : Colors.black),
                      ),
                    ),
                  ),
                );
              },
              layoutBuilder: (context, colors, child) => Row(
                children: [for (final Color color in colors) child(color)],
              ),
            ),
          ),
        );
      },
    );
  }
}
