import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:rclone_client/rclone_client.dart';

class BoardPainter extends CustomPainter {
  BoardPainter({required this.pixels});

  final List<BoardPixel> pixels;

  @override
  void paint(Canvas canvas, Size size) {
    for (final pixel in pixels) {
      final color = colorFromHex(pixel.color)!;
      canvas.drawPoints(
        PointMode.points,
        [Offset(pixel.x, pixel.y)],
        Paint()
          ..color = color
          ..strokeWidth = 10
          ..style =
              color == Colors.white ? PaintingStyle.fill : PaintingStyle.stroke,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
