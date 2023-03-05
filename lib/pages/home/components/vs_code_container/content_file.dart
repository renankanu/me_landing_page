import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/dracula.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../model/file_config.dart';

class ContentFile extends StatelessWidget {
  const ContentFile({
    super.key,
    required this.scrollController,
    required this.fileConfig,
  });

  final ScrollController scrollController;
  final FileConfig fileConfig;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        controller: scrollController,
        physics: const ClampingScrollPhysics(),
        children: [
          HighlightView(
            fileConfig.fileContent,
            language: fileConfig.typeFile.description,
            theme: draculaTheme,
            padding: const EdgeInsets.all(12),
            textStyle: GoogleFonts.robotoMono(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
