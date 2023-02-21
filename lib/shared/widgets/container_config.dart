import 'package:flutter/material.dart';
import 'package:me_landing_page/shared/app_colors.dart';

class ConfigContainer extends StatelessWidget {
  const ConfigContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.woodsmoke,
        border: Border.all(
          color: AppColors.boulder,
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: child,
    );
  }
}
