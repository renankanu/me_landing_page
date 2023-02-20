import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:me_landing_page/shared/app_colors.dart';
import 'package:me_landing_page/shared/app_images.dart';
import 'package:me_landing_page/shared/utils/app_responsive.dart';
import 'package:me_landing_page/shared/widgets/avatar_animation.dart';

import '../../../shared/widgets/social_button.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final padding = width * 0.03;
    return LayoutBuilder(builder: (_, constraints) {
      if (Responsive.isMobile(context)) {
        return Container(
          height: 100,
          width: 100,
          color: Colors.green,
        );
      }
      if (Responsive.isTablet(context)) {
        return Container(
          height: 100,
          width: 100,
          color: Colors.red,
        );
      }
      return Stack(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(padding, 140, padding, 0),
            child: Image.asset(
              AppImages.bg,
              fit: BoxFit.none,
              height: 460,
              width: constraints.maxWidth,
              color: Colors.grey[700]!.withOpacity(0.2),
            ),
          ),
          Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Padding(
                padding: EdgeInsets.fromLTRB(padding, 160, 8, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SelectableText(
                            'Renan Santos',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 80,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SelectableText(
                            'Flutter Developer',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          SelectableText(
                            '''Sou desenvolvedor na Megaleios, sou de Cianorte-PR.
Trabalho com desenvolvimento desde 2016,
conheço algumas tecnologias mas hoje estou focado em Flutter.''',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 40),
                          Row(
                            children: [
                              SocialButton(
                                name: 'GitHub',
                                buttonColor: AppColors.riverBed,
                                icon: AppImages.github,
                              ),
                              const SizedBox(width: 20),
                              SocialButton(
                                name: 'LinkedIn',
                                buttonColor: AppColors.blueChill,
                                icon: AppImages.linkedin,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: padding),
                      child: AvatarAnimation(
                        child: Stack(
                          children: [
                            ClipOval(
                              child: Image.asset(
                                AppImages.renanFour,
                                fit: BoxFit.fill,
                                height: 406,
                                width: 406,
                              ),
                            ),
                            Container(
                              height: 408,
                              width: 408,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(300),
                                border: Border.all(
                                  color: AppColors.blueChill,
                                  width: 6,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      );
    });
  }
}
