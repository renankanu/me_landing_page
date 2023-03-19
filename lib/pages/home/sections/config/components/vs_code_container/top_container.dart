import 'package:flutter/material.dart';

import '../../../../../../shared/app_colors.dart';

class TopContainer extends StatelessWidget {
  const TopContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: AppColors.woodsmoke,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
            ),
          ),
          child: Row(
            children: [
              Container(
                height: 12,
                width: 12,
                decoration: const BoxDecoration(
                  color: AppColors.chestnut,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                height: 12,
                width: 12,
                decoration: const BoxDecoration(
                  color: AppColors.tussock,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                height: 12,
                width: 12,
                decoration: const BoxDecoration(
                  color: AppColors.apple,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ),
        const Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Divider(
            color: AppColors.woodsmokeBorder,
            thickness: 1,
            height: 0,
          ),
        )
      ],
    );
  }
}
