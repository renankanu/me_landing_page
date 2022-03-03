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
      width: 84,
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
            assetIcon: BaseImages.icHome,
          ),
          MenuButton(
            assetIcon: BaseImages.icSkill,
          ),
          MenuButton(
            assetIcon: BaseImages.icRepo,
          ),
          MenuButton(
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
  }) : super(key: key);

  final String assetIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: BaseColors.burntSienna,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Image.asset(
          assetIcon,
          height: 36,
          width: 36,
          color: Colors.white,
        ),
      ),
    );
  }
}
