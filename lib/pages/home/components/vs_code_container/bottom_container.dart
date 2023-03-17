import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_landing_page/shared/app_colors.dart';
import 'package:me_landing_page/shared/app_images.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: AppColors.woodsmoke,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
          ),
          height: 21,
          child: Row(
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Container(
                  width: 34,
                  height: 21,
                  decoration: const BoxDecoration(
                    color: AppColors.sanMarino,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                    ),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      AppImages.remote,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                      height: 12,
                      width: 12,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 1,
            color: AppColors.woodsmokeBorder,
          ),
        )
      ],
    );
  }
}
