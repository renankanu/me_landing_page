import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:me_landing_page/app/core/colors.dart';
import 'package:me_landing_page/app/core/images.dart';
import 'package:me_landing_page/app/modules/home/views/widgets/left_menu.dart';
import 'package:me_landing_page/app/modules/home/views/widgets/social_button.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.vistaWhite,
      body: Container(
        child: Stack(
          children: [
            LeftMenu(),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 184, top: 64, right: 80),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: 476,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SelectableText(
                            'Olá!',
                            style: Get.textTheme.headline5,
                          ),
                          SizedBox(height: 16),
                          SelectableText(
                            "Eu sou Renan Santos. Desenvolvedor Flutter.",
                            style: Get.textTheme.headline3!.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 40,
                            ),
                          ),
                          SizedBox(height: 48),
                          SelectableText(
                            "Sou desenvolvedor na Megaleios, sou de Cianorte-PR. Trabalho com desenvolvimento desde 2016, conheço algumas tecnologias mas hoje estou focado em Flutter.",
                            style: Get.textTheme.bodyText2!.copyWith(
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 32),
                          Row(
                            children: [
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
                            padding: EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 22,
                            ),
                            margin: EdgeInsets.only(top: 32),
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
                    SizedBox(width: 194),
                    Container(
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
                            decoration: BoxDecoration(
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
            )
          ],
        ),
      ),
    );
  }
}
