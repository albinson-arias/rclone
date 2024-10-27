import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rclone_flutter/core/utils/assets/gen/assets.gen.dart';
import 'package:rclone_flutter/presentation/cubits/pixels_cubit/pixels_cubit.dart';

class SelectUsernameScreen extends StatefulWidget {
  const SelectUsernameScreen({
    super.key,
  });

  @override
  State<SelectUsernameScreen> createState() => _SelectUsernameScreenState();
}

class _SelectUsernameScreenState extends State<SelectUsernameScreen> {
  final TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  bool hasSubmitted = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void submit() {
    if (!hasSubmitted) {
      setState(() {
        hasSubmitted = true;
      });
    }
    if (formKey.currentState!.validate()) {
      final value = controller.value.text.trim();
      context.read<PixelsCubit>().loadPixels(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF313338),
      body: Form(
        key: formKey,
        autovalidateMode:
            hasSubmitted ? AutovalidateMode.always : AutovalidateMode.disabled,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 36),
                BplaceTextLogo(),
                SizedBox(height: 12),
                SizedBox(height: 12),
                Text(
                  'Nombre de usuario',
                  style: GoogleFonts.silkscreen(
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
                  style: GoogleFonts.silkscreen(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    fillColor: Color(0xFF1e1f22),
                    filled: true,
                    border: InputBorder.none,
                    errorStyle: GoogleFonts.silkscreen(
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
                      style: GoogleFonts.silkscreen(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BplaceTextLogo extends StatelessWidget {
  const BplaceTextLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Assets.logo.svg(
          height: 48,
          width: 48,
        ),
        SizedBox(width: 5),
        Text(
          'Bplace',
          // style: GoogleFonts.silkscreen(
          style: GoogleFonts.jacquardaBastarda9(
            // color: Colors.white,
            color: Colors.blue.shade300,
            fontWeight: FontWeight.w900,
            fontSize: 40,
          ),
        ),
      ],
    );
  }
}
