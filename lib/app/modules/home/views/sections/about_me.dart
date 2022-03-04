import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/core.dart';
import '../widgets/social_button.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 64),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
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
                      children: const [
                        SocialButton(
                          iconName: BaseImages.icLinkedin,
                          color: BaseColors.cornflowerBlue,
                        ),
                        SocialButton(
                          iconName: BaseImages.icGithub,
                          color: BaseColors.deepBlush,
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
              ),
              const SizedBox(width: 194),
              SizedBox(
                height: 432,
                width: 462,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Image.asset(
                        BaseImages.dots,
                        height: 200,
                        color: BaseColors.burntSienna,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Image.asset(
                        BaseImages.dots,
                        height: 200,
                        color: BaseColors.burntSienna,
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
            ],
          ),
        ),
      ),
    );
  }
}