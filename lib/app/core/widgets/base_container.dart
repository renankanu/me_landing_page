import 'package:flutter/material.dart';

class BaseContainer extends StatelessWidget {
  const BaseContainer({
    Key? key,
    required this.child,
    this.backgroundColor,
  }) : super(key: key);

  final Widget child;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 124),
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
