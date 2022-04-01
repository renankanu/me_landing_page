import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  Themes._();
  static final lightTheme = ThemeData.light().copyWith(
    textTheme: GoogleFonts.poppinsTextTheme(),
  );
}
