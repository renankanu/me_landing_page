import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Responsive {
  const Responsive._();

  static bool isMobile() => MediaQuery.of(Get.context!).size.width < 850;

  static bool isTablet() =>
      MediaQuery.of(Get.context!).size.width < 1100 &&
      MediaQuery.of(Get.context!).size.width >= 850;

  static bool isDesktop() {
    return MediaQuery.of(Get.context!).size.width >= 1100;
  }

  static double getHeight(double percent) =>
      MediaQuery.of(Get.context!).size.height * percent;

  static double getWidth(double percent) =>
      MediaQuery.of(Get.context!).size.width * percent;
}
