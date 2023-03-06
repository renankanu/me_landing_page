import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/dracula.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../model/file_config.dart';
import '../../../../shared/app_colors.dart';

class ContentFile extends StatelessWidget {
  const ContentFile({
    super.key,
    required this.scrollController,
    required this.fileConfig,
    this.isShrinkWrap = false,
    this.scrollPhysics = const ClampingScrollPhysics(),
  });

  final ScrollController scrollController;
  final FileConfig fileConfig;
  final bool isShrinkWrap;
  final ScrollPhysics scrollPhysics;

  @override
  Widget build(BuildContext context) {
    final isCopied = ValueNotifier(false);
    return Stack(
      children: [
        Container(
          color: const Color(0xff282a36),
          child: ListView(
            controller: scrollController,
            physics: scrollPhysics,
            shrinkWrap: isShrinkWrap,
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
        ),
        Positioned(
          top: 20,
          right: 20,
          child: ValueListenableBuilder(
            valueListenable: isCopied,
            builder: (_, copied, __) => GestureDetector(
              onTap: () {
                isCopied.value = true;
                Clipboard.setData(
                  ClipboardData(text: fileConfig.fileContent),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xff44475a),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                  border: copied
                      ? const Border.fromBorderSide(
                          BorderSide(
                            color: AppColors.blueChill,
                            width: 1,
                          ),
                        )
                      : null,
                ),
                child: Row(
                  children: [
                    Icon(
                      copied ? Icons.check : Icons.copy,
                      size: 16,
                      color: copied ? AppColors.blueChill : null,
                    ),
                    const SizedBox(width: 8),
                    Text(copied ? 'Arquivo copiado' : 'Copy to Clipboard')
                  ],
                ),
              ).animate(
                onPlay: (controller) {
                  if (copied) {
                    controller.forward();
                  } else {
                    controller.reverse();
                  }
                },
              ).shake(),
            ),
          ),
        )
      ],
    );
  }
}
