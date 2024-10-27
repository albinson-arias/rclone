import 'package:flutter/material.dart';
import 'package:rclone_flutter/core/utils/assets/gen/fonts.gen.dart';
import 'package:rclone_flutter/presentation/widgets/bplace_text_logo.dart';

class SelectUsernameMobile extends StatelessWidget {
  const SelectUsernameMobile({
    super.key,
    required this.submit,
    required this.controller,
  });

  final VoidCallback submit;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 36),
          Center(child: BplaceTextLogo()),
          SizedBox(height: 12),
          SizedBox(height: 12),
          Text(
            'Nombre de usuario',
            style: TextStyle(
              fontFamily: FontFamily.silkscreen,
              color: Color(0xFFb3b8bf),
              fontSize: 12,
            ),
          ),
          SizedBox(height: 6),
          TextFormField(
            controller: controller,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Requerido';
              }
              return null;
            },
            autofocus: true,
            onFieldSubmitted: (value) {
              submit();
            },
            cursorColor: Colors.blue.shade300,
            style: TextStyle(
              fontFamily: FontFamily.silkscreen,
              color: Colors.white,
            ),
            decoration: InputDecoration(
              fillColor: Color(0xFF1e1f22),
              filled: true,
              border: InputBorder.none,
              errorStyle: TextStyle(
                fontFamily: FontFamily.silkscreen,
                color: Colors.red,
              ),
            ),
          ),
          SizedBox(height: 18),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: submit,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade300,
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Ingresar',
                style: TextStyle(
                  fontFamily: FontFamily.silkscreen,
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
