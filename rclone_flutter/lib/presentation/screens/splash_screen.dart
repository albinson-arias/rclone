import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rclone_flutter/core/routing/app_routes.dart';
import 'package:rclone_flutter/core/utils/assets/gen/assets.gen.dart';

bool showedSplash = false;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    showedSplash = true;
    Future<void>.delayed(Duration(milliseconds: 500)).then(
      (value) {
        if (mounted) {
          context.goNamed(AppRoutes.board.name);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF313338),
      body: Hero(
        tag: 'BplaceTextLogo',
        child: Center(
          child: Assets.logo.svg(
            width: 125,
            height: 125,
          ),
        ),
      ),
    );
  }
}
