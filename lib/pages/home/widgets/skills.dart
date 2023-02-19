import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:me_landing_page/model/skill.dart';
import 'package:me_landing_page/shared/app_images.dart';

import '../../../shared/utils/app_responsive.dart';

class Skills extends StatelessWidget {
  const Skills({Key? key}) : super(key: key);

  List<Skill> get _mySkills => [
        Skill(name: 'Flutter', image: AppImages.flutter),
        Skill(name: 'Dart', image: AppImages.dart),
        Skill(name: 'Firebase', image: AppImages.firebase),
        Skill(name: 'Kotlin', image: AppImages.kotlin),
        Skill(name: 'React Native', image: AppImages.rn),
        Skill(name: 'Google Play', image: AppImages.googlePlay),
        Skill(name: 'App Store', image: AppImages.appStore),
        Skill(name: 'AWS', image: AppImages.aws),
        Skill(name: 'Docker', image: AppImages.docker),
        Skill(name: 'Git', image: AppImages.git),
        Skill(name: 'JavaScript', image: AppImages.js),
        Skill(name: 'TypeScript', image: AppImages.ts),
        Skill(name: 'PHP', image: AppImages.php),
        Skill(name: 'Linux', image: AppImages.linux),
        Skill(name: 'Postman', image: AppImages.postman),
      ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final padding = width * 0.03;
    ScrollController scrollController = ScrollController();

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
      return Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(padding, 80, padding, 80),
          child: Column(
            children: [
              Text(
                'Minhas Skills',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 60,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 3,
                ),
              ),
              SizedBox(
                height: 200,
                child: Stack(
                  children: [
                    ListView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: scrollController,
                      itemCount: _mySkills.length,
                      itemBuilder: (context, index) {
                        final skill = _mySkills[index];
                        return Center(
                          child: Container(
                            height: 200,
                            width: 200,
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black.withOpacity(0.5),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  skill.name,
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 3,
                                  ),
                                ),
                                SvgPicture.asset(
                                  skill.image,
                                  width: 80,
                                  height: 80,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: () {
                          if (scrollController.offset == 0) {
                            return;
                          }
                          scrollController.animateTo(
                            scrollController.offset - 700,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.bounceInOut,
                          );
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () {
                          scrollController.animateTo(
                            scrollController.offset + 700,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
