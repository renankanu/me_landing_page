import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core.dart';

class BaseContainer extends StatelessWidget {
  const BaseContainer({
    Key? key,
    required this.child,
    this.backgroundColor,
  }) : super(key: key);

  final Widget child;
  final Color? backgroundColor;

  double _getHorizontalPadding(BuildContext context) {
    if (Responsive.isDesktop()) {
      return 80;
    }
    return 24;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: _getHorizontalPadding(context),
            vertical: 64,
          ),
          color: backgroundColor ?? Colors.transparent,
          constraints: BoxConstraints(
            minHeight: Get.height * 0.9,
            maxWidth: 1440,
            minWidth: 1440,
          ),
          child: child,
        );
      },
    );
  }
}
