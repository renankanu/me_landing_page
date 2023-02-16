import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:me_landing_page/shared/app_colors.dart';
import 'package:me_landing_page/shared/app_images.dart';

import '../../../shared/widgets/social_button.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return LayoutBuilder(builder: (_, constraints) {
      return Stack(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(width * 0.1, 140, width * 0.1, 0),
            child: Image.asset(
              AppImages.bg,
              fit: BoxFit.none,
              height: 600,
              width: constraints.maxWidth,
              color: Colors.grey[700]!.withOpacity(0.2),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 160, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Renan Santos',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 80,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Flutter Developer',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        '''Sou desenvolvedor na Megaleios, sou de Cianorte-PR.
Trabalho com desenvolvimento desde 2016,
conheço algumas tecnologias mas hoje estou focado em Flutter.

Eu sou apaixonado por tecnologia e adoro aprender coisas novas.''',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 40),
                      Row(
                        children: const [
                          SocialButton(
                            name: 'GitHub',
                            buttonColor: AppColors.riverBed,
                            shadowColor: Color(0x19000000),
                            icon: AppImages.github,
                          ),
                          SizedBox(width: 20),
                          SocialButton(
                            name: 'LinkedIn',
                            buttonColor: AppColors.blueChill,
                            shadowColor: Color(0x3314b8a6),
                            icon: AppImages.linkedin,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(width: 100),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(1),
                        child: Image.asset(
                          AppImages.one,
                          fit: BoxFit.contain,
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
                            color: AppColors.ebonyClay,
                            width: 6,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      );
    });
  }
}
