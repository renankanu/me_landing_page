import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:me_landing_page/shared/app_colors.dart';
import 'package:me_landing_page/shared/app_images.dart';
import 'package:me_landing_page/shared/utils/app_responsive.dart';
import 'package:me_landing_page/shared/widgets/avatar_animation.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../shared/widgets/social_button.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final padding = width * 0.03;
    return LayoutBuilder(builder: (_, constraints) {
      final isMobile = Responsive.isMobile(context);
      return Stack(
        children: [
          Padding(
              padding: EdgeInsets.fromLTRB(padding, 140, padding, 0),
              child: Image(
                image: const AssetImage(
                  AppImages.bg,
                ),
                fit: BoxFit.none,
                height: isMobile ? 700 : 460,
                width: constraints.maxWidth,
                color: Colors.grey[700]!.withOpacity(0.2),
                excludeFromSemantics: true,
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                  if (wasSynchronouslyLoaded) {
                    return child;
                  } else {
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: frame != null ? child : const SizedBox.shrink(),
                    );
                  }
                },
              )),
          Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Padding(
                padding: EdgeInsets.fromLTRB(padding, 160, 8, 0),
                child: Visibility(
                  visible: Responsive.isDesktop(context),
                  replacement: Column(
                    children: const [
                      MyAvatar(
                        size: 306,
                      ),
                      MyDesc(
                        isMobile: true,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Expanded(
                        child: MyDesc(),
                      ),
                      MyAvatar(),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      );
    });
  }
}

class MyAvatar extends StatelessWidget {
  const MyAvatar({
    super.key,
    this.size = 408,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return AvatarAnimation(
      size: size + 80,
      child: Stack(
        children: [
          ClipOval(
            child: Image(
              image: const AssetImage(
                AppImages.renanFour,
              ),
              excludeFromSemantics: true,
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                if (wasSynchronouslyLoaded) {
                  return child;
                } else {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: frame != null ? child : const SizedBox.shrink(),
                  );
                }
              },
            ),
          ),
          Container(
            height: size,
            width: size,
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
    );
  }
}

class MyDesc extends StatelessWidget {
  const MyDesc({
    super.key,
    this.isMobile = false,
  });
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        if (isMobile) const SizedBox(height: 40),
        SelectableText(
          'Renan Santos',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: isMobile ? 40 : 80,
            fontWeight: FontWeight.bold,
          ),
        ),
        SelectableText(
          'Flutter Developer',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: isMobile ? 25 : 50,
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
            fontSize: isMobile ? 14 : 18,
          ),
        ),
        const SizedBox(height: 40),
        TextButton(
            onPressed: () {
              context.go('/game');
            },
            child: const Text('Abrir Game')),
        Row(
          mainAxisAlignment:
              isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            SocialButton(
              name: 'GitHub',
              buttonColor: AppColors.riverBed,
              icon: AppImages.github,
              onTap: () async {
                if (kReleaseMode) {
                  await FirebaseAnalytics.instance
                      .logEvent(name: 'Github Click');
                }
                final url = Uri.parse('https://github.com/renankanu');
                if (!await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
              },
            ),
            const SizedBox(width: 20),
            SocialButton(
              name: 'LinkedIn',
              buttonColor: AppColors.blueChill,
              icon: AppImages.linkedin,
              onTap: () async {
                if (kReleaseMode) {
                  await FirebaseAnalytics.instance
                      .logEvent(name: 'LinkedIn Click');
                }
                final url =
                    Uri.parse('https://www.linkedin.com/in/renansantosbr/');
                if (!await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
