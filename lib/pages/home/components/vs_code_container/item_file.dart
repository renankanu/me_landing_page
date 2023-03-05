import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemFile extends StatelessWidget {
  const ItemFile({
    super.key,
    required this.icon,
    required this.nameFile,
  });

  final String icon;
  final String nameFile;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 64,
          top: 8,
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 16,
              height: 16,
            ),
            const SizedBox(width: 8),
            Text(
              nameFile,
              style: GoogleFonts.roboto(
                color: const Color(0xFFAAB1D3),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
