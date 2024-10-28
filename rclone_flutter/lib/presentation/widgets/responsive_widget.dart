import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({
    super.key,
    required this.desktop,
    required this.mobile,
    this.tablet,
  });

  final Widget desktop;
  final Widget mobile;
  final Widget? tablet;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Define breakpoints for mobile, tablet, and desktop
        if (constraints.maxWidth < 600) {
          // Mobile layout
          return mobile;
        } else if (constraints.maxWidth < 1200 && tablet != null) {
          // Tablet layout, only if tablet widget is provided
          return tablet!;
        } else {
          // Desktop layout
          return desktop;
        }
      },
    );
  }
}
