import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/core.dart';

class Skills extends StatelessWidget {
  const Skills({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 100,
                height: 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: BaseColors.burntSienna,
                ),
              ),
              const SizedBox(width: 40),
              SelectableText(
                'Minhas Skills',
                style: Get.textTheme.headline2!.copyWith(
                  fontSize: 38,
                ),
              ),
              const SizedBox(width: 40),
              Container(
                width: 100,
                height: 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: BaseColors.burntSienna,
                ),
              )
            ],
          ),
          const SizedBox(height: 80),
          Center(
            child: Wrap(
              runSpacing: 40,
              spacing: 40,
              children: const [
                ItemCardSkill(
                  imageSkill: '',
                  titleSkill: 'Flutter',
                  descriptionSkill:
                      'Desenvolvimento de aplicativos utilizando Flutter',
                ),
                ItemCardSkill(
                  imageSkill: BaseImages.icFireBase,
                  titleSkill: 'Firebase',
                  descriptionSkill:
                      'Desenvolvimento de aplicativos utilizando Flutter',
                ),
                ItemCardSkill(
                  imageSkill: BaseImages.icAppleStore,
                  titleSkill: 'Apple Store',
                  descriptionSkill:
                      'Desenvolvimento de aplicativos utilizando Flutter',
                ),
                ItemCardSkill(
                  imageSkill: BaseImages.icGooglePlay,
                  titleSkill: 'Google Play',
                  descriptionSkill:
                      'Desenvolvimento de aplicativos utilizando Flutter',
                ),
                ItemCardSkill(
                  imageSkill: BaseImages.icGit,
                  titleSkill: 'Git',
                  descriptionSkill:
                      'Desenvolvimento de aplicativos utilizando Flutter',
                ),
                ItemCardSkill(
                  imageSkill: BaseImages.icPhp,
                  titleSkill: 'PHP',
                  descriptionSkill:
                      'Desenvolvimento de aplicativos utilizando Flutter',
                ),
                ItemCardSkill(
                  imageSkill: BaseImages.icDocker,
                  titleSkill: 'Docker',
                  descriptionSkill:
                      'Desenvolvimento de aplicativos utilizando Flutter',
                ),
                ItemCardSkill(
                  imageSkill: BaseImages.icAws,
                  titleSkill: 'AWS',
                  descriptionSkill:
                      'Desenvolvimento de aplicativos utilizando Flutter',
                ),
                ItemCardSkill(
                  imageSkill: BaseImages.icReactNative,
                  titleSkill: 'React Native',
                  descriptionSkill:
                      'Desenvolvimento de aplicativos utilizando Flutter',
                ),
                ItemCardSkill(
                  imageSkill: BaseImages.icJs,
                  titleSkill: 'JavaScript',
                  descriptionSkill:
                      'Desenvolvimento de aplicativos utilizando Flutter',
                ),
                ItemCardSkill(
                  imageSkill: BaseImages.icTs,
                  titleSkill: 'TypeScript',
                  descriptionSkill:
                      'Desenvolvimento de aplicativos utilizando Flutter',
                ),
              ],
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
            scale = 1.02;
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
          width: 210,
          decoration: BoxDecoration(
            color: BaseColors.vistaWhite,
            boxShadow: [
              BoxShadow(
                color: BaseColors.ebonyClay.withOpacity(0.8),
                blurRadius: 5,
                offset: Offset.zero,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Visibility(
                visible: widget.titleSkill == 'Flutter',
                child: const FlutterLogo(size: 80),
                replacement: Image.asset(
                  widget.imageSkill,
                  height: 80,
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
            ],
          ),
        ),
      ),
    );
  }
}
