import 'package:flutter/material.dart';
import 'package:rclone_flutter/core/utils/assets/gen/assets.gen.dart';
import 'package:rclone_flutter/core/utils/assets/gen/fonts.gen.dart';

class BplaceTextLogo extends StatelessWidget {
  const BplaceTextLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Hero(
          tag: 'BplaceTextLogo',
          child: Assets.logo.svg(
            height: 48,
            width: 48,
          ),
        ),
        SizedBox(width: 5),
        Text(
          'Bplace',
          style: TextStyle(
            fontFamily: FontFamily.jacquardaBastarda9,
            color: Colors.blue.shade300,
            fontWeight: FontWeight.w900,
            fontSize: 40,
          ),
        ),
      ],
    );
  }
}
