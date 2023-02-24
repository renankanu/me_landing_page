import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AppBaseContainer extends StatelessWidget {
  const AppBaseContainer({
    Key? key,
    required this.child,
    this.percentCallback = 0.5,
    required this.callback,
  }) : super(key: key);

  final Widget child;
  final double percentCallback;
  final Function(bool) callback;

  @override
  Widget build(BuildContext context) {
    final start = ValueNotifier(false);

    return VisibilityDetector(
      key: UniqueKey(),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.5) {
          start.value = true;
          callback(true);
        } else {
          start.value = false;
          callback(false);
        }
      },
      child: child,
    );
  }
}
