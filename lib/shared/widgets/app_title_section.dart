import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:me_landing_page/shared/app_colors.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AppTitleSection extends StatelessWidget {
  AppTitleSection({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;
  final start = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: start,
        builder: (_, started, __) {
          return VisibilityDetector(
            key: Key(title),
            onVisibilityChanged: (visibilityInfo) {
              final visiblePercentage = visibilityInfo.visibleFraction * 100;
              if (visiblePercentage > 80) {
                start.value = true;
              } else {
                start.value = false;
              }
            },
            child: Stack(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColors.blueChill.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                )
                    .animate(
                      target: started ? 1.0 : 0.0,
                      onPlay: (controller) {
                        if (!started) {
                          controller.forward();
                        } else {
                          controller.reverse();
                        }
                      },
                    )
                    .shake(curve: Curves.easeInOut, hz: 0.7, duration: 2000.ms)
                    .slideX(curve: Curves.easeOut, begin: -0.6, end: 0.0)
                    .slideY(curve: Curves.bounceOut, begin: -0.6, end: 0.0)
                    .rotate(curve: Curves.easeInOut, begin: 0.0, end: 0.15),
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 3,
                  ),
                ),
              ],
            ),
          );
        });
  }
}
