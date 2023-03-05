import 'package:flutter/material.dart';

import '../../../../shared/app_colors.dart';

class NavigationLeft extends StatelessWidget {
  const NavigationLeft({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: 50,
      decoration: const BoxDecoration(
        color: AppColors.woodsmoke,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(0),
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(0),
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: AppColors.comet,
                  width: 2,
                ),
              ),
            ),
            child: const Icon(
              Icons.code,
              color: AppColors.comet,
              size: 24,
            ),
          ),
          const Icon(
            Icons.code,
            color: AppColors.tuna,
            size: 24,
          ),
        ],
      ),
    );
  }
}
