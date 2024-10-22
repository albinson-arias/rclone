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
