import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:me_landing_page/shared/app_colors.dart';
import 'package:me_landing_page/shared/app_images.dart';

import '../../../shared/utils/app_responsive.dart';

class Menu extends StatelessWidget {
  const Menu({
    super.key,
    required this.onSelected,
  });

  final Function(int) onSelected;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
        child: Container(
          width: double.infinity,
          height: 80,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.ebonyClay.withOpacity(0.6),
                AppColors.ebonyClay.withOpacity(0.6),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            border: const Border(
              bottom: BorderSide(
                color: AppColors.ebony,
                width: 1,
              ),
            ),
          ),
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: isMobile
                ? MainAxisAlignment.spaceAround
                : MainAxisAlignment.start,
            children: [
              if (!isMobile)
                Row(
                  children: [
                    const SizedBox(width: 20),
                    SvgPicture.asset(
                      AppImages.logo,
                      width: 40,
                      height: 40,
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
              ItemMenu(
                label: 'Home',
                onPressed: () {
                  onSelected(0);
                },
              ),
              ItemMenu(
                label: 'Skills',
                onPressed: () {
                  onSelected(1);
                },
              ),
              ItemMenu(
                label: 'Config',
                onPressed: () {
                  onSelected(2);
                },
              ),
              ItemMenu(
                label: 'Jobs',
                onPressed: () {
                  onSelected(3);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemMenu extends StatelessWidget {
  ItemMenu({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;

  final start = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: start,
      builder: (_, started, __) {
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) => start.value = true,
          onExit: (_) => start.value = false,
          child: GestureDetector(
            onTap: onPressed,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                label,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
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
                  .scaleXY(
                    end: 1,
                    curve: Curves.easeOutBack,
                    duration: 200.ms,
                  )
                  .moveY(end: -2)
                  .elevation(end: 8)
                  .boxShadow(
                    begin: const BoxShadow(
                      color: Colors.transparent,
                    ),
                    end: BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 18.0,
                      offset: const Offset(4.0, 4.0),
                    ),
                  ),
            ),
          ),
        );
      },
    );
  }
}
