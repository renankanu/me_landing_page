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
        constraints: BoxConstraints(maxWidth: 1440),
        child: Stack(
          children: [
            LeftMenu(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 184, vertical: 64),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 476,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Olá!',
                          style: Get.textTheme.headline5,
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Eu sou Renan Santos.\nDesenvolvedor Flutter.",
                          style: Get.textTheme.headline3!.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 40,
                          ),
                        ),
                        SizedBox(height: 48),
                        Text(
                          "Frontend developer based in tehran, Iran.\nI am coding with a clean and beautiful problem solving in mind.",
                          style: Get.textTheme.bodyText2!.copyWith(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 16),
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
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 416,
                    width: 446,
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
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
