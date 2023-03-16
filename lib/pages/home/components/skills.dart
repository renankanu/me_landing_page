import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:me_landing_page/model/skill.dart';
import 'package:me_landing_page/shared/app_colors.dart';
import 'package:me_landing_page/shared/app_images.dart';

import '../../../shared/utils/app_responsive.dart';
import '../../../shared/widgets/app_title_section.dart';
import 'github_stats/languages_git.dart';
import 'github_stats/profile_info.dart';

class Skills extends StatelessWidget {
  const Skills({Key? key}) : super(key: key);

  List<Skill> get _actualSkills => [
        Skill(name: 'Flutter', image: AppImages.flutter),
        Skill(name: 'Dart', image: AppImages.dart),
        Skill(name: 'Firebase', image: AppImages.firebase),
        Skill(name: 'Google Play', image: AppImages.googlePlay),
        Skill(name: 'App Store', image: AppImages.appStore),
        Skill(name: 'Git', image: AppImages.git),
        Skill(name: 'React Native', image: AppImages.rn),
      ];

  List<Skill> get _mySkills => [
        Skill(name: 'Kotlin', image: AppImages.kotlin),
        Skill(name: 'AWS', image: AppImages.aws),
        Skill(name: 'Docker', image: AppImages.docker),
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
    return Container(
      color: AppColors.ebony.withOpacity(0.4),
      child: LayoutBuilder(
        builder: (_, constraints) {
          return Center(
            child: Container(
              margin: const EdgeInsets.only(top: 80),
              constraints: const BoxConstraints(minWidth: 1800),
              padding: globalPadding(context, padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const AppTitleSection(
                    title: 'Tecnologias e Skills',
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Aqui são algumas das minhas skills e tecnologias que trabalho diariamente:',
                    style: GoogleFonts.poppins(
                      color: Colors.white.withOpacity(0.7),
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Align(
                    alignment: Alignment.center,
                    child: Wrap(
                      children: _actualSkills.map(
                        (skill) {
                          final isEven = _actualSkills.indexOf(skill) % 2 == 0;
                          return Item(
                            skill: skill,
                            isEven: isEven,
                          );
                        },
                      ).toList(),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'Aqui estão algumas das tecnologias que já trabalhei:',
                    style: GoogleFonts.poppins(
                      color: Colors.white.withOpacity(0.7),
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Align(
                    alignment: Alignment.center,
                    child: Wrap(
                      children: _mySkills.map(
                        (skill) {
                          final isEven = _mySkills.indexOf(skill) % 2 == 0;
                          return Item(
                            skill: skill,
                            isEven: isEven,
                          );
                        },
                      ).toList(),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    '# GitHub Stats:',
                    style: GoogleFonts.poppins(
                      color: Colors.white.withOpacity(0.7),
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const ProfileGitInfoInfo(),
                  const SizedBox(height: 20),
                  const LanguagesGit(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Item extends StatelessWidget {
  Item({
    super.key,
    required this.skill,
    required this.isEven,
  });

  final Skill skill;
  final bool isEven;

  final start = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return SizedBox(
      height: isMobile ? 160 : 240,
      width: isMobile ? 160 : 240,
      child: ValueListenableBuilder(
        valueListenable: start,
        builder: (context, started, _) => Center(
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (_) => start.value = true,
            onExit: (_) => start.value = false,
            child: Container(
              height: isMobile ? 220 : 300,
              width: isMobile ? 220 : 300,
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.boulder.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20),
                border: started
                    ? Border.all(
                        color: Colors.white.withOpacity(0.2),
                        width: 2,
                      )
                    : null,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(4.0, 4.0),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    skill.name,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: isMobile ? 14 : 20,
                      fontWeight: isMobile ? FontWeight.w400 : FontWeight.w700,
                      letterSpacing: 3,
                    ),
                  ),
                  SvgPicture.asset(
                    skill.image,
                    width: isMobile ? 60 : 100,
                    height: isMobile ? 60 : 100,
                  ),
                ],
              ),
            )
                .animate(
                  target: started ? 1 : 0,
                  onPlay: (controller) {
                    if (started) {
                      controller.forward();
                    } else {
                      controller.reverse();
                    }
                  },
                )
                .rotate(
                  begin: 0.0,
                  end: isEven ? 0.01 : -0.01,
                  duration: 400.ms,
                  curve: Curves.easeIn,
                )
                .scale(
                  begin: const Offset(1, 1),
                  end: const Offset(1.1, 1.1),
                ),
          ),
        ),
      ),
    );
  }
}
