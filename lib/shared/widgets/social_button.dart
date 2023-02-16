import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    Key? key,
    required this.buttonColor,
    required this.shadowColor,
    required this.name,
  }) : super(key: key);

  final Color buttonColor;
  final Color shadowColor;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 205.08,
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
          BoxShadow(
            color: shadowColor,
            blurRadius: 15,
            offset: const Offset(0, 10),
          ),
        ],
        color: buttonColor,
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(name,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              )),
          const SizedBox(width: 6),
          SizedBox(
            width: 22,
            height: 22,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const FlutterLogo(size: 22),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
