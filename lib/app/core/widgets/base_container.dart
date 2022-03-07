import 'package:flutter/material.dart';

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
    if (Responsive.isMobile(context)) {
      return 24;
    }
    if (Responsive.isTablet(context)) {
      return 48;
    }
    return 124;
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: _getHorizontalPadding(context),
        vertical: 64,
      ),
      color: backgroundColor ?? Colors.transparent,
      constraints: BoxConstraints(
        minHeight: height * 0.9,
        maxWidth: 1440,
        minWidth: 1440,
      ),
      child: child,
    );
  }
}
