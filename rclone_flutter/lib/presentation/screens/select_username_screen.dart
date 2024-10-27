import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rclone_flutter/presentation/cubits/pixels_cubit/pixels_cubit.dart';
import 'package:rclone_flutter/presentation/screens/select_username_desktop.dart';
import 'package:rclone_flutter/presentation/screens/select_username_mobile.dart';
import 'package:rclone_flutter/presentation/widgets/responsive_widget.dart';

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
          child: ResponsiveWidget(
            desktop: SelectUsernameDesktop(
              submit: submit,
              controller: controller,
            ),
            tablet: SelectUsernameDesktop(
              submit: submit,
              controller: controller,
            ),
            mobile: SelectUsernameMobile(
              submit: submit,
              controller: controller,
            ),
          ),
        ),
      ),
    );
  }
}
