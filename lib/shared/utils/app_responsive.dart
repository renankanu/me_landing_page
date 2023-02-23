import 'package:flutter/material.dart';

class Responsive {
  const Responsive._();

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 850;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 850;

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1100;
  }

  static double getHeight(double percent, BuildContext context) =>
      MediaQuery.of(context).size.height * percent;

  static double getWidth(double percent, BuildContext context) =>
      MediaQuery.of(context).size.width * percent;
}

EdgeInsets globalPadding(BuildContext context, double padding) {
  return EdgeInsets.fromLTRB(
    Responsive.isMobile(context) ? 20 : padding + 40,
    20,
    Responsive.isMobile(context) ? 20 : padding + 40,
    80,
  );
}
