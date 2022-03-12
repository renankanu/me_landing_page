import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    Key? key,
    required this.iconName,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  final String iconName;
  final Color color;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
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
      ),
    );
  }
}
