import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/core.dart';
import '../../../../core/section_keys.dart';
import '../../controllers/home_controller.dart';

class LeftMenu extends StatelessWidget {
  LeftMenu({Key? key}) : super(key: key);
  final _controller = Get.find<HomeController>();
  final List<String> _sectionsIcons = [
    BaseImages.icHome,
    BaseImages.icSkill,
    BaseImages.icRepo,
    BaseImages.icExperience,
  ];
  final List<GlobalKey<State<StatefulWidget>>> _sectionsNames = [
    SectionKeys.about,
    SectionKeys.skills,
    SectionKeys.repositories,
    SectionKeys.experience,
  ];

  void scrollToSpecificContext(BuildContext context) {
    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOutBack,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 683,
      width: 68,
      decoration: const BoxDecoration(
        color: BaseColors.ebonyClay,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
        primary: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: SelectableText.rich(
                TextSpan(
                  text: 'R',
                  style: Get.textTheme.headline4!.copyWith(
                    color: BaseColors.burntSienna,
                    fontWeight: FontWeight.w600,
                  ),
                  children: [
                    TextSpan(
                      text: 'K;',
                      style: Get.textTheme.headline4!.copyWith(
                        color: BaseColors.burntSienna,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              color: BaseColors.burntSienna,
              thickness: 1,
              height: 1,
            ),
            ..._sectionsIcons.map(
              (sectionIcon) {
                final index = _sectionsIcons.indexOf(sectionIcon);
                return Obx(
                  () => MenuButton(
                    isSelected: index == _controller.selectedIndex,
                    assetIcon: sectionIcon,
                    onTap: () {
                      scrollToSpecificContext(
                        _sectionsNames[index].currentContext!,
                      );
                      _controller.selectedIndex = index;
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton({
    Key? key,
    required this.assetIcon,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  final String assetIcon;
  final bool isSelected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
        if (!Responsive.isDesktop(context)) {
          Get.back();
        }
      },
      child: Container(
        margin: const EdgeInsets.only(top: 24),
        height: 60,
        width: 60,
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
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
          ),
        ),
      ),
    );
  }
}
