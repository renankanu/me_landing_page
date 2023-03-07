import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_landing_page/shared/app_images.dart';

import '../../../../shared/app_colors.dart';

class NavigationLeft extends StatelessWidget {
  const NavigationLeft({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height,
      width: 50,
      decoration: const BoxDecoration(
        color: AppColors.woodsmoke,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(0),
          bottomLeft: Radius.circular(0),
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
            child: const ItemIcon(
              icon: AppImages.files,
              color: AppColors.comet,
            ),
          ),
          const ItemIcon(icon: AppImages.search),
          const ItemIcon(icon: AppImages.debug),
          const ItemIcon(icon: AppImages.remoteExplorer),
          const ItemIcon(icon: AppImages.beaker),
          const ItemIcon(icon: AppImages.githubVsCode),
          const Spacer(),
          const ItemIcon(icon: AppImages.account),
          const ItemIcon(icon: AppImages.gear),
        ],
      ),
    );
  }
}

class ItemIcon extends StatelessWidget {
  const ItemIcon({
    super.key,
    required this.icon,
    this.color,
  });

  final String icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: SizedBox(
        height: 48,
        width: 48,
        child: Center(
          child: SvgPicture.asset(
            icon,
            colorFilter: ColorFilter.mode(
              color ?? AppColors.tuna,
              BlendMode.srcIn,
            ),
            width: 24,
            height: 24,
          ),
        ),
      ),
    );
  }
}
