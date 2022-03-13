import 'package:flutter/material.dart';

enum BaseSlideDirection {
  leftToRight,
  rightToLeft,
  topToBottom,
  bottomToTop,
}

class BaseSlideAnimation extends StatefulWidget {
  const BaseSlideAnimation({
    Key? key,
    required this.child,
    this.direction = BaseSlideDirection.leftToRight,
    this.duration = const Duration(milliseconds: 800),
    this.curve = Curves.elasticInOut,
  }) : super(key: key);

  final Widget child;
  final BaseSlideDirection? direction;
  final Duration? duration;
  final Curve curve;

  @override
  _BaseSlideAnimationState createState() => _BaseSlideAnimationState();
}

SlideTransition _createSlideAnimation(
  Animation<double> animation,
  Widget child,
  Offset begin,
  Offset end,
) {
  final tween = Tween(
    begin: begin,
    end: end,
  );

  return SlideTransition(
    position: tween.animate(animation),
    child: child,
  );
}

SlideTransition slideUp(Animation<double> animation, Widget child) {
  const Offset start = Offset(0.0, 1.0);
  const Offset end = Offset.zero;
  return _createSlideAnimation(
    animation,
    child,
    start,
    end,
  );
}

SlideTransition slideDown(Animation<double> animation, Widget child) {
  const Offset start = Offset(0.0, -1.0);
  const Offset end = Offset.zero;
  return _createSlideAnimation(
    animation,
    child,
    start,
    end,
  );
}

SlideTransition slideToLeft(
  Animation<double> animation,
  Widget child,
) {
  const Offset start = Offset(1.0, 0.0);
  const Offset end = Offset.zero;
  return _createSlideAnimation(
    animation,
    child,
    start,
    end,
  );
}

SlideTransition slideToRight(
  Animation<double> animation,
  Widget child,
) {
  const Offset start = Offset(-1.0, 0.0);
  const Offset end = Offset.zero;
  return _createSlideAnimation(
    animation,
    child,
    start,
    end,
  );
}

Widget _checkDirection({
  required Animation<double> animation,
  required Widget child,
  BaseSlideDirection? direction,
}) {
  switch (direction) {
    case BaseSlideDirection.leftToRight:
      return slideToRight(animation, child);
    case BaseSlideDirection.rightToLeft:
      return slideToLeft(animation, child);
    case BaseSlideDirection.topToBottom:
      return slideDown(animation, child);
    case BaseSlideDirection.bottomToTop:
      return slideUp(animation, child);
    default:
      return slideUp(animation, child);
  }
}

class _BaseSlideAnimationState extends State<BaseSlideAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    );
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _checkDirection(
      animation: _animation,
      child: widget.child,
      direction: widget.direction,
    );
  }
}
