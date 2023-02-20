import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:me_landing_page/shared/app_colors.dart';

class AppTitleSection extends StatelessWidget {
  const AppTitleSection({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: AppColors.blueChill.withOpacity(0.4),
            borderRadius: BorderRadius.circular(20),
          ),
        )
            .animate()
            .shake(curve: Curves.easeInOut, hz: 0.5, duration: 2000.ms)
            .slideX(curve: Curves.easeOut, begin: -0.6, end: 0.0)
            .slideY(curve: Curves.bounceOut, begin: -0.6, end: 0.0)
            .rotate(curve: Curves.easeInOut, begin: 0.0, end: 0.15),
        Text(
          title,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 60,
            fontWeight: FontWeight.w700,
            letterSpacing: 3,
          ),
        ),
      ],
    );
  }
}
