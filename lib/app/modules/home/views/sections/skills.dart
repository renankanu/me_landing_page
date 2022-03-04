import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/core.dart';

class Skills extends StatelessWidget {
  const Skills({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Minhas Skills',
                style: Get.textTheme.headline2!.copyWith(
                  fontSize: 38,
                ),
              ),
              const SizedBox(width: 40),
              Container(
                width: 200,
                height: 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: BaseColors.burntSienna,
                ),
              )
            ],
          ),
          const SizedBox(height: 60),
          Wrap(
            runSpacing: 10,
            spacing: 80,
            children: const [
              ItemCardSkill(
                imageSkill: '',
                titleSkill: 'Flutter',
                descriptionSkill:
                    'Desenvolvimento de aplicativos utilizando Flutter',
              ),
              ItemCardSkill(
                imageSkill: BaseImages.icReactNative,
                titleSkill: 'React Native',
                descriptionSkill:
                    'Desenvolvimento de aplicativos utilizando Flutter',
              ),
            ],
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
    required this.descriptionSkill,
  }) : super(key: key);

  final String imageSkill;
  final String titleSkill;
  final String descriptionSkill;

  @override
  State<ItemCardSkill> createState() => _ItemCardSkillState();
}

class _ItemCardSkillState extends State<ItemCardSkill> {
  double scale = 1;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (value) {
        if (value) {
          setState(() {
            scale = 1.01;
          });
        } else {
          setState(() {
            scale = 1;
          });
        }
      },
      child: Transform.scale(
        scale: scale,
        child: Container(
          padding: const EdgeInsets.all(20),
          width: 300,
          height: 280,
          decoration: BoxDecoration(
            color: BaseColors.vistaWhite,
            boxShadow: [
              BoxShadow(
                color: BaseColors.ebonyClay.withOpacity(0.5),
                blurRadius: 4,
                offset: const Offset(4, 4),
              ),
            ],
            border: const Border(
              left: BorderSide(
                color: BaseColors.ebonyClay,
                width: 4,
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Visibility(
                visible: widget.titleSkill == 'Flutter',
                child: const FlutterLogo(size: 100),
                replacement: Image.asset(
                  widget.imageSkill,
                  height: 100,
                ),
              ),
              const SizedBox(height: 8),
              SelectableText(
                widget.titleSkill,
                style: Get.textTheme.headline5!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 12),
              SelectableText(
                widget.descriptionSkill,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
