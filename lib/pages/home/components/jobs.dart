import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:me_landing_page/shared/app_colors.dart';
import 'package:me_landing_page/shared/utils/app_responsive.dart';
import 'package:me_landing_page/shared/widgets/app_title_section.dart';
import 'package:visibility_detector/visibility_detector.dart';

class Jobs extends StatelessWidget {
  const Jobs({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    double padding = width * 0.03;
    final start = ValueNotifier(false);

    return Container(
      color: AppColors.ebony.withOpacity(0.4),
      padding: const EdgeInsets.only(top: 80),
      child: VisibilityDetector(
        key: const Key('jobs'),
        onVisibilityChanged: (visibilityInfo) {
          final visiblePercentage = visibilityInfo.visibleFraction * 100;
          if (visiblePercentage > 30) {
            start.value = true;
          }
        },
        child: LayoutBuilder(
          builder: (_, __) {
            return ValueListenableBuilder(
              valueListenable: start,
              builder: (_, started, __) {
                return Center(
                  child: Container(
                    constraints: const BoxConstraints(minWidth: 1800),
                    padding: globalPadding(context, padding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppTitleSection(
                          title: 'Experiência Profissional',
                        ),
                        const SizedBox(height: 40),
                        if (Responsive.isMobile(context))
                          Column(
                            children: const [
                              Work(),
                              SizedBox(height: 40),
                              Knowledge(),
                            ],
                          )
                        else
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Expanded(
                                child: Work(),
                              )
                                  .animate(
                                    target: started ? 1.0 : 0.0,
                                    onPlay: (controller) {
                                      if (started) {
                                        controller.forward();
                                      }
                                    },
                                  )
                                  .moveX(
                                    begin: -100,
                                    end: 0,
                                    duration: 1.seconds,
                                    curve: Curves.fastOutSlowIn,
                                  )
                                  .fadeIn(
                                    begin: 0,
                                  ),
                              const SizedBox(width: 40),
                              const Expanded(
                                child: Knowledge(),
                              )
                                  .animate(
                                    target: started ? 1.0 : 0.0,
                                    onPlay: (controller) {
                                      if (started) {
                                        controller.forward();
                                      }
                                    },
                                  )
                                  .moveX(
                                    begin: 100,
                                    end: 0,
                                    duration: 1.seconds,
                                    curve: Curves.fastOutSlowIn,
                                  )
                                  .fadeIn(
                                    begin: 0,
                                  ),
                            ],
                          ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class Knowledge extends StatelessWidget {
  const Knowledge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Aqui está o resumo de minha formação acadêmica e cursos.',
          style: GoogleFonts.poppins(
            color: Colors.white.withOpacity(0.7),
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 40),
        Stack(
          children: [
            Positioned(
              top: 0,
              left: 4,
              bottom: 0,
              child: Container(
                width: 2,
                decoration: const BoxDecoration(
                  color: AppColors.blueChill,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.blueChill,
                      blurRadius: 4,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: const [
                  ItemWorkKnowledge(
                    title: 'Universidade Paranaense(UNIPAR) - 2015',
                    description: '- Análise e Desenvolvimento de Sistemas',
                  ),
                  ItemWorkKnowledge(
                    title: 'Udemy - 2021',
                    description:
                        '- Flutter utilizando TDD; \n- Clean Architecture; \n- Design Patterns; \n- SOLID;',
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class Work extends StatelessWidget {
  const Work({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Aqui está o resumo de minha experiência profissional.',
          style: GoogleFonts.poppins(
            color: Colors.white.withOpacity(0.7),
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 40),
        Stack(
          children: [
            Positioned(
              top: 0,
              left: 4,
              bottom: 0,
              child: Container(
                width: 2,
                decoration: const BoxDecoration(
                  color: AppColors.blueChill,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.blueChill,
                      blurRadius: 4,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: const [
                  ItemWorkKnowledge(
                    title: 'Megaleios - 2019 até o momento',
                    description:
                        '- Desenvolvimento com Flutter; \n- Modular(gerência de dependências, rotas); \n- Bloc, RxDart, GetX; \n- Integração com Firebase; \n- Integração com OneSignal; \n- Figma; \n- Publicar App nas lojas(Apple e GooglePlay); \n- CD com Bitrise; \n- Integração com APIs REST; \n-Clean Architecture; \n-TDD; \n- Visionamento de código com git; \n- Desenvolvimento com React Native;',
                  ),
                  ItemWorkKnowledge(
                    title: 'Sisterra - 2015 até 2019',
                    description:
                        '- Desenvolvimento de aplicativos para Android nativo (Java e Kotlin); \n- Desenvolvimento de aplicações em PHP utilizando DDD para back-end; \n- APIs REST; \n- CQRS pattern; \n- Conhecimento em Docker; \n- Publicar App nas lojas(Apple e GooglePlay); \n- Conhecimento em AWS (Lambda, SNS, SQS, SES, EC2, RDS, S3); \n- Integração com APIs REST; \n- Usuário Linux (GNU / Linux Ubuntu);',
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ItemWorkKnowledge extends StatelessWidget {
  const ItemWorkKnowledge({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: AppColors.blueChill,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.blueChill,
                        blurRadius: 4,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 20,
                  height: 2,
                  decoration: const BoxDecoration(
                    color: AppColors.blueChill,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.blueChill,
                        blurRadius: 4,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 40,
              ),
              margin: const EdgeInsets.only(bottom: 40),
              decoration: BoxDecoration(
                color: AppColors.woodsmoke.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColors.woodsmoke,
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    description,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      letterSpacing: 1,
                      height: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemJobDesc extends StatelessWidget {
  const ItemJobDesc({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.ebony.withOpacity(0.4),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.ebony,
              ),
            ),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 12,
                          width: 12,
                          margin: const EdgeInsets.only(left: 54, top: 7),
                          decoration: BoxDecoration(
                            color: AppColors.blueChill,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Container(
                          height: 12,
                          width: 12,
                          margin: const EdgeInsets.only(left: 54, top: 7),
                          decoration: BoxDecoration(
                            color: AppColors.blueChill,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          description,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            letterSpacing: 1,
                            height: 2,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
