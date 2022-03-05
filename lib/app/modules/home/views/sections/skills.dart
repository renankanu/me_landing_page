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
          const SizedBox(height: 10),
          SelectableText(
            'Essas são as minhas skills, que eu tenho, eu gosto de aprender e estou sempre em busca de novas habilidades.',
            style: Get.textTheme.bodyMedium!.copyWith(),
          ),
          const SizedBox(height: 60),
          Center(
            child: Wrap(
              runSpacing: 40,
              spacing: 40,
              children: const [
                ItemCardSkill(
                  imageSkill: '',
                  titleSkill: 'Flutter',
                ),
                ItemCardSkill(
                  imageSkill: BaseImages.icFireBase,
                  titleSkill: 'Firebase',
                ),
                ItemCardSkill(
                  imageSkill: BaseImages.icAppleStore,
                  titleSkill: 'Apple Store',
                ),
                ItemCardSkill(
                  imageSkill: BaseImages.icGooglePlay,
                  titleSkill: 'Google Play',
                ),
                ItemCardSkill(
                  imageSkill: BaseImages.icGit,
                  titleSkill: 'Git',
                ),
                ItemCardSkill(
                  imageSkill: BaseImages.icPhp,
                  titleSkill: 'PHP',
                ),
                ItemCardSkill(
                  imageSkill: BaseImages.icDocker,
                  titleSkill: 'Docker',
                ),
                ItemCardSkill(
                  imageSkill: BaseImages.icAws,
                  titleSkill: 'AWS',
                ),
                ItemCardSkill(
                  imageSkill: BaseImages.icReactNative,
                  titleSkill: 'React Native',
                ),
                ItemCardSkill(
                  imageSkill: BaseImages.icJs,
                  titleSkill: 'JavaScript',
                ),
                ItemCardSkill(
                  imageSkill: BaseImages.icTs,
                  titleSkill: 'TypeScript',
                ),
                ItemCardSkill(
                  imageSkill: BaseImages.icDart,
                  titleSkill: 'Dart',
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
  double scale = 1;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInBack,
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
        scale: Tween(begin: 0.96, end: 1.0).animate(_animation),
        child: Container(
          padding: const EdgeInsets.all(20),
          width: 210,
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Visibility(
                visible: widget.titleSkill == 'Flutter',
                child: const FlutterLogo(size: 60),
                replacement: Image.asset(
                  widget.imageSkill,
                  height: 60,
                ),
              ),
              const SizedBox(height: 12),
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
