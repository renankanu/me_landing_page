import 'package:flutter/material.dart';

Path get pathGit {
  const size = 36;
  Path path = Path();
  path.moveTo(size * 0.1083333, size * 0.4412500);
  path.lineTo(size * 0.3491667, size * 0.2000000);
  path.lineTo(size * 0.4195833, size * 0.2708333);
  path.arcToPoint(const Offset(size * 0.4583333, size * 0.3637500),
      radius: const Radius.elliptical(size * 0.08333333, size * 0.08333333),
      rotation: 0,
      largeArc: false,
      clockwise: false);
  path.lineTo(size * 0.4583333, size * 0.5945833);
  path.arcToPoint(const Offset(size * 0.4166667, size * 0.6666667),
      radius: const Radius.elliptical(size * 0.08333333, size * 0.08333333),
      rotation: 0,
      largeArc: false,
      clockwise: false);
  path.arcToPoint(const Offset(size * 0.5833333, size * 0.6666667),
      radius: const Radius.elliptical(size * 0.08333333, size * 0.08333333),
      rotation: 0,
      largeArc: false,
      clockwise: false);
  path.arcToPoint(const Offset(size * 0.5416667, size * 0.5945833),
      radius: const Radius.elliptical(size * 0.08333333, size * 0.08333333),
      rotation: 0,
      largeArc: false,
      clockwise: false);
  path.lineTo(size * 0.5416667, size * 0.3920833);
  path.lineTo(size * 0.6279167, size * 0.4791667);
  path.arcToPoint(const Offset(size * 0.6250000, size * 0.5000000),
      radius: const Radius.elliptical(size * 0.04875000, size * 0.04875000),
      rotation: 0,
      largeArc: false,
      clockwise: false);
  path.arcToPoint(const Offset(size * 0.7083333, size * 0.4166667),
      radius: const Radius.elliptical(size * 0.08333333, size * 0.08333333),
      rotation: 0,
      largeArc: true,
      clockwise: false);
  path.arcToPoint(const Offset(size * 0.6875000, size * 0.4195833),
      radius: const Radius.elliptical(size * 0.04875000, size * 0.04875000),
      rotation: 0,
      largeArc: false,
      clockwise: false);
  path.lineTo(size * 0.5804167, size * 0.3125000);
  path.arcToPoint(const Offset(size * 0.5325000, size * 0.2150000),
      radius: const Radius.elliptical(size * 0.08333333, size * 0.08333333),
      rotation: 0,
      largeArc: false,
      clockwise: false);
  path.arcToPoint(const Offset(size * 0.4791667, size * 0.2112500),
      radius: const Radius.elliptical(size * 0.08750000, size * 0.08750000),
      rotation: 0,
      largeArc: false,
      clockwise: false);
  path.lineTo(size * 0.4083333, size * 0.1408333);
  path.lineTo(size * 0.4412500, size * 0.1083333);
  path.arcToPoint(const Offset(size * 0.5587500, size * 0.1083333),
      radius: const Radius.elliptical(size * 0.08333333, size * 0.08333333),
      rotation: 0,
      largeArc: false,
      clockwise: true);
  path.lineTo(size * 0.8920833, size * 0.4416667);
  path.arcToPoint(const Offset(size * 0.8920833, size * 0.5591667),
      radius: const Radius.elliptical(size * 0.08333333, size * 0.08333333),
      rotation: 0,
      largeArc: false,
      clockwise: true);
  path.lineTo(size * 0.5587500, size * 0.8925000);
  path.arcToPoint(const Offset(size * 0.4412500, size * 0.8925000),
      radius: const Radius.elliptical(size * 0.08333333, size * 0.08333333),
      rotation: 0,
      largeArc: false,
      clockwise: true);
  path.lineTo(size * 0.1079167, size * 0.5591667);
  path.arcToPoint(const Offset(size * 0.1083333, size * 0.4412500),
      radius: const Radius.elliptical(size * 0.08333333, size * 0.08333333),
      rotation: 0,
      largeArc: false,
      clockwise: true);
  path.close();
  return path;
}

Path get pathFlutter {
  const size = 36;
  Path path_0 = Path();
  path_0.moveTo(size * 0.5909062, size * 0.4637500);
  path_0.lineTo(size * 0.3382187, size * 0.7159375);
  path_0.lineTo(size * 0.5908750, size * 0.9685938);
  path_0.lineTo(size * 0.8788125, size * 0.9685938);
  path_0.lineTo(size * 0.6265312, size * 0.7160000);
  path_0.lineTo(size * 0.8788125, size * 0.4637187);
  path_0.lineTo(size * 0.5909375, size * 0.4637187);
  path_0.close();
  path_0.moveTo(size * 0.5903750, size * 0.03137500);
  path_0.lineTo(size * 0.1212187, size * 0.5000000);
  path_0.lineTo(size * 0.2657188, size * 0.6445000);
  path_0.lineTo(size * 0.8781875, size * 0.03190625);
  path_0.lineTo(size * 0.5908750, size * 0.03190625);
  path_0.close();
  return path_0;
}

Path get pathDart {
  const size = 36;
  Path path = Path();
  path.moveTo(size * 0.6887188, size * 0.1921563);
  path.cubicTo(size * 0.6536563, size * 0.1572187, size * 0.6181563,
      size * 0.1227500, size * 0.5818750, size * 0.08909375);
  path.cubicTo(size * 0.5716562, size * 0.07800000, size * 0.5570625,
      size * 0.07106250, size * 0.5408438, size * 0.07106250);
  path.cubicTo(size * 0.5405938, size * 0.07106250, size * 0.5403750,
      size * 0.07106250, size * 0.5401250, size * 0.07106250);
  path.lineTo(size * 0.5401563, size * 0.07106250);
  path.cubicTo(size * 0.5276250, size * 0.07228125, size * 0.5161250,
      size * 0.07496875, size * 0.5052500, size * 0.07896875);
  path.lineTo(size * 0.5062188, size * 0.07865625);
  path.lineTo(size * 0.2793438, size * 0.1920938);
  path.close();
  path.moveTo(size * 0.2185938, size * 0.2185938);
  path.lineTo(size * 0.2185938, size * 0.6782500);
  path.cubicTo(size * 0.2182813, size * 0.6808437, size * 0.2180938,
      size * 0.6838437, size * 0.2180938, size * 0.6868750);
  path.cubicTo(size * 0.2180938, size * 0.7063125, size * 0.2256875,
      size * 0.7240000, size * 0.2380625, size * 0.7370937);
  path.lineTo(size * 0.2380312, size * 0.7370625);
  path.lineTo(size * 0.4299688, size * 0.9289687);
  path.lineTo(size * 0.7627500, size * 0.9289687);
  path.lineTo(size * 0.7627500, size * 0.7627187);
  path.close();
  path.moveTo(size * 0.1921250, size * 0.1920938);
  path.cubicTo(size * 0.1921250, size * 0.1920938, size * 0.3891875,
      size * 0.09362500, size * 0.4876875, size * 0.04434375);
  path.cubicTo(size * 0.5031875, size * 0.03653125, size * 0.5214375,
      size * 0.03196875, size * 0.5407812, size * 0.03196875);
  path.cubicTo(size * 0.5424062, size * 0.03196875, size * 0.5440625,
      size * 0.03200000, size * 0.5456875, size * 0.03206250);
  path.lineTo(size * 0.5454687, size * 0.03206250);
  path.cubicTo(size * 0.5706562, size * 0.03703125, size * 0.5927500,
      size * 0.04781250, size * 0.6111250, size * 0.06300000);
  path.lineTo(size * 0.6108750, size * 0.06281250);
  path.lineTo(size * 0.9680312, size * 0.4200000);
  path.lineTo(size * 0.9680312, size * 0.8017500);
  path.lineTo(size * 0.8017812, size * 0.8017500);
  path.lineTo(size * 0.8017812, size * 0.9680000);
  path.lineTo(size * 0.4138437, size * 0.9680000);
  path.lineTo(size * 0.06287500, size * 0.6170312);
  path.cubicTo(size * 0.04428125, size * 0.5979062, size * 0.03262500,
      size * 0.5719375, size * 0.03209375, size * 0.5432187);
  path.lineTo(size * 0.03209375, size * 0.5431250);
  path.cubicTo(size * 0.03368750, size * 0.5271562, size * 0.03806250,
      size * 0.5125625, size * 0.04475000, size * 0.4993125);
  path.lineTo(size * 0.04443750, size * 0.5000312);
  path.close();
  return path;
}
