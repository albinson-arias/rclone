import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rclone_flutter/core/utils/assets/gen/assets.gen.dart';

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
        Assets.logo.svg(
          height: 48,
          width: 48,
        ),
        SizedBox(width: 5),
        Text(
          'Bplace',
          style: GoogleFonts.jacquardaBastarda9(
            color: Colors.blue.shade300,
            fontWeight: FontWeight.w900,
            fontSize: 40,
          ),
        ),
      ],
    );
  }
}
