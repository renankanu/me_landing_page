import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:me_landing_page/shared/app_colors.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AppTitleSection extends StatelessWidget {
  const AppTitleSection({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final start = ValueNotifier(false);
    return VisibilityDetector(
      key: UniqueKey(),
      onVisibilityChanged: (info) {
        final percent = info.visibleFraction * 100;
        if (percent > 20) {
          start.value = true;
        }
      },
      child: ValueListenableBuilder(
        valueListenable: start,
        builder: (_, started, __) => Stack(
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
      ),
    );
  }
}
