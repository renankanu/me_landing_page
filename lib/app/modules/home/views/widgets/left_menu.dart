import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:me_landing_page/app/core/colors.dart';
import 'package:me_landing_page/app/core/images.dart';

class LeftMenu extends StatelessWidget {
  const LeftMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 683,
      width: 68,
      decoration: BoxDecoration(
        color: BaseColors.ebonyClay,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'RK;',
              style: Get.textTheme.headline4!.copyWith(
                color: BaseColors.burntSienna,
              ),
            ),
          ),
          Divider(
            color: BaseColors.burntSienna,
            thickness: 1,
            height: 1,
          ),
          MenuButton(
            isSelected: true,
            assetIcon: BaseImages.icHome,
          ),
          MenuButton(
            isSelected: false,
            assetIcon: BaseImages.icSkill,
          ),
          MenuButton(
            isSelected: false,
            assetIcon: BaseImages.icRepo,
          ),
          MenuButton(
            isSelected: false,
            assetIcon: BaseImages.icExperience,
          ),
        ],
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton({
    Key? key,
    required this.assetIcon,
    required this.isSelected,
  }) : super(key: key);

  final String assetIcon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 48),
      height: isSelected ? 50 : 40,
      width: isSelected ? 50 : 40,
      decoration: BoxDecoration(
        color: isSelected ? BaseColors.burntSienna : Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Image.asset(
          assetIcon,
          height: isSelected ? 30 : 24,
          width: isSelected ? 30 : 24,
          color: isSelected ? Colors.white : BaseColors.ebonyClay,
        ),
      ),
    );
  }
}
