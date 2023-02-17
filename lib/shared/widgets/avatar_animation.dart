import 'dart:math';

import 'package:flutter/material.dart';
import 'package:me_landing_page/shared/app_colors.dart';

import 'flutter_path.dart';

class AvatarAnimation extends StatefulWidget {
  const AvatarAnimation({
    Key? key,
    required this.child,
    this.outerIconsSize = 3,
    this.innerIconsSize = 3,
    this.innerColor = AppColors.blueChill,
    this.outerColor = AppColors.burntSienna,
    this.reverse = true,
    this.size = 488,
    this.innerAnimationSeconds = 30,
    this.outerAnimationSeconds = 30,
    this.innerAnimation = Curves.linear,
    this.outerAnimation = Curves.linear,
  }) : super(key: key);

  final double outerIconsSize;
  final double innerIconsSize;
  final Color innerColor;
  final Color outerColor;
  final bool reverse;
  final int innerAnimationSeconds;
  final int outerAnimationSeconds;
  final Curve innerAnimation;
  final Curve outerAnimation;
  final double size;
  final Widget child;

  @override
  State<AvatarAnimation> createState() => _AvatarAnimationState();
}

class _AvatarAnimationState extends State<AvatarAnimation>
    with TickerProviderStateMixin {
  late Animation<double> animation1;
  late Animation<double> animation2;
  late AnimationController controller2;
  late AnimationController controller1;

  @override
  void initState() {
    controller1 = AnimationController(
        duration: Duration(seconds: widget.innerAnimationSeconds), vsync: this);

    controller2 = AnimationController(
        duration: Duration(seconds: widget.outerAnimationSeconds), vsync: this);

    animation1 = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller1,
        curve: Interval(0.0, 1.0, curve: widget.innerAnimation)));

    final secondAnimation = Tween<double>(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(
            parent: controller2,
            curve: Interval(0.0, 1.0, curve: widget.outerAnimation)));

    // reverse or same direction animation
    widget.reverse
        ? animation2 = ReverseAnimation(secondAnimation)
        : animation2 = secondAnimation;

    controller2.repeat();
    controller1.repeat();
    super.initState();
  }

  Center _firstArc() {
    return Center(
      child: RotationTransition(
        turns: animation1,
        child: CustomPaint(
          painter: Arc1Painter(
              color: widget.innerColor, iconsSize: widget.outerIconsSize),
          child: SizedBox(
            width: 0.85 * widget.size,
            height: 0.85 * widget.size,
          ),
        ),
      ),
    );
  }

  Center _secondArc() {
    return Center(
      child: RotationTransition(
        turns: animation2,
        child: CustomPaint(
          painter: Arc2Painter(
              color: widget.outerColor, iconsSize: widget.innerIconsSize),
          child: SizedBox(
            width: widget.size * 0.9,
            height: widget.size * 0.9,
          ),
        ),
      ),
    );
  }

  Center _child() {
    return Center(
      child: SizedBox(
        width: widget.size * 0.8,
        height: widget.size * 0.8,
        child: widget.child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        _firstArc(),
        _secondArc(),
        _child(),
      ],
    );
  }
}

class Arc1Painter extends CustomPainter {
  Arc1Painter({required this.color, this.iconsSize = 3});

  final Color color;
  final double iconsSize;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint p = Paint()
      ..color = color
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);

    // draw the two arcs
    canvas.drawArc(rect, 0.15, 0.9 * pi, false, p);
    canvas.drawArc(rect, 1.05 * pi, 0.9 * pi, false, p);

    // draw the cross
    final centerY = size.width / 2;
    canvas.drawLine(Offset(-iconsSize, centerY - iconsSize),
        Offset(iconsSize, centerY + iconsSize), p);
    canvas.drawLine(Offset(iconsSize, centerY - iconsSize),
        Offset(-iconsSize, centerY + iconsSize), p);

    canvas.drawLine(Offset(size.width - iconsSize, centerY - iconsSize),
        Offset(size.width + iconsSize, centerY + iconsSize), p);

    canvas.drawLine(Offset(size.width + iconsSize, centerY - iconsSize),
        Offset(size.width - iconsSize, centerY + iconsSize), p);

    // draw the circle
    canvas.drawCircle(Offset(size.width, centerY), iconsSize, p);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class Arc2Painter extends CustomPainter {
  Arc2Painter({required this.color, this.iconsSize = 3});

  final Color color;
  final double iconsSize;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint p = Paint()
      ..color = color
      ..strokeWidth = 1.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final Rect rect = Rect.fromLTWH(0.0, 0.0, size.width, size.height);
    canvas.drawArc(rect, 0.0, 0.67 * pi, false, p);
    canvas.drawArc(rect, 0.74 * pi, 0.56 * pi, false, p);
    canvas.drawArc(rect, 1.40 * pi, 0.54 * pi, false, p);

    p.style = PaintingStyle.fill;
    canvas.drawPath(pathGit.shift(const Offset(100, 0)), p);
    canvas.rotate(pi / 2);
    canvas.drawPath(pathFlutter.shift(const Offset(176, -470)), p);
    canvas.rotate(pi / 4);
    canvas.drawPath(pathDart.shift(const Offset(208, -360)), p);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
