import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 16),
        child: Container(
          width: double.infinity,
          height: 80,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.grey.withAlpha(20),
                Colors.grey.withAlpha(20),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: const EdgeInsets.all(24),
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Row(
                children: [
                  ItemMenu(
                    label: 'Home',
                    onPressed: () {},
                  ),
                  ItemMenu(
                    label: 'Skills',
                    onPressed: () {},
                  ),
                  ItemMenu(
                    label: 'Repositórios',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ItemMenu extends StatelessWidget {
  const ItemMenu({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      child: Text(label,
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          )),
    );
  }
}
