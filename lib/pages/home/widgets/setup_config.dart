import 'package:flutter/material.dart';
import 'package:flutter_highlight/themes/dracula.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:flutter_highlight/themes/dracula.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:me_landing_page/shared/app_colors.dart';

import '../../../shared/app_images.dart';
import '../../../shared/utils/app_responsive.dart';
import '../../../shared/widgets/app_title_section.dart';
import '../../../shared/widgets/expanded_widget.dart';

class SetupConfig extends StatelessWidget {
  SetupConfig({Key? key}) : super(key: key);
  final isExpandedVsCode = ValueNotifier(false);
  final isExpandedMakefile = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final padding = width * 0.03;
    return LayoutBuilder(
      builder: (_, constraints) {
        if (Responsive.isMobile(context)) {
          return Container(
            height: 100,
            width: 100,
            color: Colors.green,
          );
        }
        if (Responsive.isTablet(context)) {
          return Container(
            height: 100,
            width: 100,
            color: Colors.red,
          );
        }
        return Center(
          child: Container(
            constraints: const BoxConstraints(minWidth: 1800),
            padding: EdgeInsets.fromLTRB(padding, 0, padding, 80),
            child: Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const AppTitleSection(
                    title: 'Setup e Configurações',
                  ),
                  Text(
                    'Aqui está algumas configurações que eu uso para desenvolver',
                    style: GoogleFonts.poppins(
                      color: Colors.white.withOpacity(0.7),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      Text(
                        'Makefile',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10),
                      SvgPicture.asset(
                        AppImages.makefile,
                        width: 30,
                        height: 30,
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(width: 20),
                      TextButton(
                        onPressed: () {
                          isExpandedMakefile.value = !isExpandedMakefile.value;
                        },
                        child: Text(
                          isExpandedMakefile.value ? 'Ocultar' : 'Mostrar',
                          style: GoogleFonts.poppins(
                            color: AppColors.blueChill,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ValueListenableBuilder(
                      valueListenable: isExpandedMakefile,
                      builder: (_, expanded, __) {
                        return ExpandedWidget(
                          expand: expanded,
                          child: FutureBuilder<String>(
                            future: DefaultAssetBundle.of(context)
                                .loadString('assets/markdown/makefile.md'),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              return MarkdownWidget(
                                shrinkWrap: true,
                                data: snapshot.data!,
                                config: MarkdownConfig(
                                  configs: [
                                    PreConfig(
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF282a36),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      language: 'makefile',
                                      theme: draculaTheme,
                                      textStyle: GoogleFonts.firaCode(
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1,
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      }),
                  Row(
                    children: [
                      Text(
                        'VSCode Settings',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10),
                      SvgPicture.asset(
                        AppImages.vscode,
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(width: 20),
                      TextButton(
                        onPressed: () {
                          isExpandedVsCode.value = !isExpandedVsCode.value;
                        },
                        child: Text(
                          isExpandedVsCode.value ? 'Ocultar' : 'Mostrar',
                          style: GoogleFonts.poppins(
                            color: AppColors.blueChill,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ValueListenableBuilder(
                    valueListenable: isExpandedVsCode,
                    builder: (_, expanded, __) {
                      return ExpandedWidget(
                        expand: expanded,
                        child: FutureBuilder<String>(
                          future: DefaultAssetBundle.of(context)
                              .loadString('assets/markdown/settings.md'),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return MarkdownWidget(
                              shrinkWrap: true,
                              data: snapshot.data!,
                              config: MarkdownConfig(
                                configs: [
                                  PreConfig(
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF282a36),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    language: 'json',
                                    theme: draculaTheme,
                                    textStyle: GoogleFonts.firaCode(
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1,
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
