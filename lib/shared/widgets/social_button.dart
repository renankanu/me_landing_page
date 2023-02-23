import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialButton extends StatelessWidget {
  SocialButton({
    Key? key,
    required this.buttonColor,
    required this.name,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  final Color buttonColor;
  final String name;
  final String icon;
  final VoidCallback? onTap;

  final start = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: start,
        builder: (_, started, __) {
          return MouseRegion(
            cursor: SystemMouseCursors.click,
            onHover: (_) => start.value = true,
            onExit: (_) => start.value = false,
            child: GestureDetector(
              onTap: onTap,
              child: Stack(
                children: [
                  Container(
                    width: 212,
                    height: 54,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: buttonColor,
                        width: 2,
                      ),
                    ),
                  ),
                  Container(
                    width: 206,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: buttonColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(name,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            )),
                        const SizedBox(width: 20),
                        SvgPicture.asset(
                          icon,
                          colorFilter: const ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                          height: 32,
                          width: 32,
                        ),
                      ],
                    ),
                  )
                      .animate(
                        target: started ? 1.0 : 0.0,
                        onPlay: (controller) {
                          if (started) {
                            controller.forward();
                          } else {
                            controller.reverse();
                          }
                        },
                      )
                      .move(
                        duration: 300.ms,
                        curve: Curves.elasticInOut,
                        begin: const Offset(-3, -3),
                        end: const Offset(1, 1),
                      ),
                ],
              ),
            ),
          );
        });
  }
}
