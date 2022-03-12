import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../../core/core.dart';
import '../../../../core/section_keys.dart';
import '../../controllers/home_controller.dart';

class LeftMenu extends StatelessWidget {
  LeftMenu({Key? key}) : super(key: key);
  final _controller = Get.find<HomeController>();
  final List<Map<String, String>> _listaTarefas = [
    {
      'icon': BaseImages.icHome,
      'icon_selected': BaseImages.icHomeSelected,
    },
    {
      'icon': BaseImages.icSkill,
      'icon_selected': BaseImages.icSkillSelected,
    },
    {
      'icon': BaseImages.icRepo,
      'icon_selected': BaseImages.icRepoSelected,
    },
    {
      'icon': BaseImages.icExperience,
      'icon_selected': BaseImages.icExperienceSelected
    },
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
      curve: Curves.easeInOutExpo,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Responsive.isDesktop(context) ? 683 : 460,
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
          children: AnimationConfiguration.toStaggeredList(
            duration: const Duration(milliseconds: 375),
            childAnimationBuilder: (widget) => SlideAnimation(
              horizontalOffset: -50,
              child: FadeInAnimation(
                child: widget,
              ),
            ),
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
              ..._listaTarefas.map(
                (sectionIcon) {
                  final index = _listaTarefas.indexOf(sectionIcon);
                  return Obx(
                    () => MenuButton(
                      isSelected: index == _controller.selectedIndex,
                      assetIcon: sectionIcon['icon']!,
                      assetIconSelected: sectionIcon['icon_selected']!,
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
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton({
    Key? key,
    required this.assetIcon,
    required this.assetIconSelected,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  final String assetIcon;
  final String assetIconSelected;
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
                isSelected ? assetIconSelected : assetIcon,
                height: isSelected ? 30 : 24,
                width: isSelected ? 30 : 24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
