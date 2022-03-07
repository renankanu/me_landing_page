import 'package:flutter/material.dart';

class Responsive {
  const Responsive._();

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 850;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 850;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  static double getHeight(BuildContext context, double percent) =>
      MediaQuery.of(context).size.height * percent;

  static double getWidth(BuildContext context, double percent) =>
      MediaQuery.of(context).size.width * percent;
}
