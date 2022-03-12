import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../../core/core.dart';
import '../../../../core/section_keys.dart';
import '../../controllers/home_controller.dart';
import '../widgets/social_button.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return VisibilityDetector(
      key: UniqueKey(),
      onVisibilityChanged: (visibility) {
        final visiblePercentage = visibility.visibleFraction * 100;
        if (visiblePercentage >= 15) {
          controller.selectedIndex = 0;
        }
      },
      child: BaseContainer(
        key: SectionKeys.about,
        child: Center(
          child: Visibility(
            visible: !Responsive.isMobile(context),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(child: ContainerAbout()),
                SizedBox(width: 48),
                Expanded(child: ContainerAvatar()),
              ],
            ),
            replacement: Column(
              children: const [
                ContainerAvatar(),
                SizedBox(height: 48),
                ContainerAbout(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ContainerAvatar extends StatelessWidget {
  const ContainerAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 432,
        width: 462,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset(
                BaseImages.dots,
                height: 180,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset(
                BaseImages.dots,
                height: 180,
              ),
            ),
            Container(
              width: 406,
              height: 406,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(BaseImages.me),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerAbout extends StatelessWidget {
  const ContainerAbout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 490,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectableText(
            'Olá!',
            style: Get.textTheme.headline5,
          ),
          const SizedBox(height: 16),
          SelectableText(
            'Eu sou Renan Santos. Desenvolvedor Flutter.',
            style: Get.textTheme.headline3!.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 40,
            ),
          ),
          const SizedBox(height: 48),
          SelectableText(
            'Sou desenvolvedor na Megaleios, sou de Cianorte-PR. Trabalho com desenvolvimento desde 2016, conheço algumas tecnologias mas hoje estou focado em Flutter.',
            style: Get.textTheme.bodyText2!.copyWith(
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              SocialButton(
                iconName: BaseImages.icLinkedin,
                color: BaseColors.cornflowerBlue,
                onPressed: () async {
                  await launch('https://www.linkedin.com/in/renansantosbr/');
                },
              ),
              SocialButton(
                iconName: BaseImages.icGithub,
                color: BaseColors.deepBlush,
                onPressed: () async {
                  await launch('https://github.com/renankanu');
                },
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 22,
            ),
            margin: const EdgeInsets.only(top: 32),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: BaseColors.atomicTangerine,
            ),
            child: SelectableText(
              'Mobile Developer',
              style: Get.textTheme.button!.copyWith(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
