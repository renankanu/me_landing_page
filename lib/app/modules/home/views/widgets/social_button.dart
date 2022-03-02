import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    Key? key,
    required this.iconName,
    required this.color,
  }) : super(key: key);

  final String iconName;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Center(
        child: Image.asset(
          iconName,
          height: 24,
          width: 24,
        ),
      ),
    );
  }
}
