import 'package:flutter/material.dart';
import 'package:rclone_flutter/core/utils/assets/gen/assets.gen.dart';
import 'package:rclone_flutter/core/utils/assets/gen/fonts.gen.dart';
import 'package:rclone_flutter/presentation/widgets/bplace_text_logo.dart';

class SelectUsernameDesktop extends StatelessWidget {
  const SelectUsernameDesktop({
    super.key,
    required this.submit,
    required this.controller,
  });

  final VoidCallback submit;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.usernameScreenBackground.path),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: BplaceTextLogo(),
            ),
          ),
          Center(
            child: Container(
              width: 300,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFF313338),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 12),
                  Center(
                    child: Text(
                      'Bienvenido',
                      style: TextStyle(
                        fontFamily: FontFamily.silkscreen,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
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
            ),
          )
        ],
      ),
    );
  }
}
