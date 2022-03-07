import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/core.dart';
import '../../../../core/section_keys.dart';
import '../../../../core/widgets/base_title_section.dart';
import '../../controllers/home_controller.dart';

class Skills extends StatefulWidget {
  const Skills({Key? key}) : super(key: key);

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends BaseState<Skills, HomeController> {
  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      key: SectionKeys.skills,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const BaseTitleSection(
            title: 'Minhas Skills',
          ),
          const SizedBox(height: 10),
          SelectableText(
            'Essas são as minhas skills, que eu tenho, eu gosto de aprender e estou sempre em busca de novas habilidades.',
            style: Get.textTheme.bodyMedium!.copyWith(),
          ),
          const SizedBox(height: 60),
          Center(
            child: Obx(
              () => Wrap(
                runSpacing: 40,
                spacing: 40,
                children: controller.skills
                    .map(
                      (skill) => ItemCardSkill(
                        imageSkill: skill.icon,
                        titleSkill: skill.name,
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemCardSkill extends StatefulWidget {
  const ItemCardSkill({
    Key? key,
    required this.imageSkill,
    required this.titleSkill,
  }) : super(key: key);

  final String imageSkill;
  final String titleSkill;

  @override
  State<ItemCardSkill> createState() => _ItemCardSkillState();
}

class _ItemCardSkillState extends State<ItemCardSkill>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutBack,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) {
        setState(() {});
        _controller.forward();
      },
      onExit: (event) {
        setState(() {});
        _controller.reverse();
      },
      child: ScaleTransition(
        scale: Tween(begin: 1.0, end: 1.1).animate(_animation),
        child: Container(
          padding: const EdgeInsets.all(20),
          width: 210,
          height: 210,
          decoration: BoxDecoration(
            color: BaseColors.vistaWhite,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: BaseColors.ebonyClay.withOpacity(0.3),
                blurRadius: 10,
                offset: Offset.zero,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Visibility(
                visible: widget.titleSkill == 'Flutter',
                child: const FlutterLogo(size: 80),
                replacement: Image.asset(
                  getIconByName(widget.imageSkill),
                  height: 80,
                ),
              ),
              SelectableText(
                widget.titleSkill,
                style: Get.textTheme.headline6!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: BaseColors.trout,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
