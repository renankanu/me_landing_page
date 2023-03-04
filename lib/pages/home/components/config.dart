import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_highlight/themes/dracula.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:me_landing_page/shared/app_colors.dart';
import 'package:me_landing_page/shared/app_constants.dart';
import 'package:me_landing_page/shared/widgets/container_config.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../shared/app_images.dart';
import '../../../shared/utils/app_responsive.dart';
import '../../../shared/widgets/app_title_section.dart';
import '../../../shared/widgets/expanded_widget.dart';

class Config extends StatelessWidget {
  const Config({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final padding = width * 0.03;
    final start = ValueNotifier(false);
    final isExpandedVsCode = ValueNotifier(false);
    final isExpandedMakefile = ValueNotifier(false);
    final isExpandedVsCodeExt = ValueNotifier(false);
    final isExpandedGit = ValueNotifier(false);
    final isExpandedZshrc = ValueNotifier(false);

    return Container(
      padding: const EdgeInsets.only(top: 80),
      child: VisibilityDetector(
        key: const Key('config'),
        onVisibilityChanged: (visibilityInfo) {
          final visiblePercentage = visibilityInfo.visibleFraction * 100;
          if (visiblePercentage > 20) {
            start.value = true;
          }
        },
        child: LayoutBuilder(
          builder: (_, __) {
            return ValueListenableBuilder(
              valueListenable: start,
              builder: (_, started, __) {
                return Center(
                  child: Container(
                    constraints: const BoxConstraints(minWidth: 1800),
                    padding: globalPadding(context, padding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        AppTitleSection(
                          title: 'Minha Config de Dev.',
                          started: started,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Aqui está algumas configurações que eu uso para desenvolver, makefile para automatizar algumas tarefas, settings do vscode para deixar o ambiente mais agradável, extensões que uso no vscode e configurações do git.',
                          style: GoogleFonts.poppins(
                            color: Colors.white.withOpacity(0.7),
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 40),
                        ConfigContainer(
                          child: ValueListenableBuilder(
                            valueListenable: isExpandedMakefile,
                            builder: (_, expanded, __) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                                      const Spacer(),
                                      IconButton(
                                        onPressed: () async {
                                          if (kReleaseMode) {
                                            await FirebaseAnalytics.instance
                                                .logEvent(
                                                    name:
                                                        'Makefile Config Click');
                                          }
                                          isExpandedMakefile.value =
                                              !isExpandedMakefile.value;
                                        },
                                        icon: AnimatedRotation(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          turns: isExpandedMakefile.value
                                              ? 0
                                              : 0.5,
                                          child: const Icon(
                                            Icons.expand_more,
                                            size: 30,
                                            color: AppColors.cornflowerBlue,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                          'Makefile config, que é um arquivo de configuração para automatizar tarefas no desenvolvimento com Flutter.')
                                      .animate(
                                        target: expanded ? 1 : 0,
                                        onPlay: (controller) {
                                          if (expanded) {
                                            controller.forward();
                                          } else {
                                            controller.reverse();
                                          }
                                        },
                                      )
                                      .slideX(
                                        begin: 0,
                                        end: -1.22,
                                        duration: 400.ms,
                                      ),
                                  ExpandedWidget(
                                    expand: expanded,
                                    child: MarkdownWidget(
                                      shrinkWrap: true,
                                      data: AppConstants.makeFileConf,
                                      config: MarkdownConfig(
                                        configs: [
                                          PreConfig(
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF282a36),
                                              borderRadius:
                                                  BorderRadius.circular(10),
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
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        ConfigContainer(
                          child: ValueListenableBuilder(
                            valueListenable: isExpandedVsCode,
                            builder: (_, expanded, __) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                                      const Spacer(),
                                      IconButton(
                                        onPressed: () async {
                                          if (kReleaseMode) {
                                            await FirebaseAnalytics.instance
                                                .logEvent(
                                                    name:
                                                        'VSCode Settings Click');
                                          }
                                          isExpandedVsCode.value =
                                              !isExpandedVsCode.value;
                                        },
                                        icon: AnimatedRotation(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          turns:
                                              isExpandedVsCode.value ? 0 : 0.5,
                                          child: const Icon(
                                            Icons.expand_more,
                                            size: 30,
                                            color: AppColors.cornflowerBlue,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                          'Configurações do VSCode que uso no dia a dia')
                                      .animate(
                                        target: expanded ? 1 : 0,
                                        onPlay: (controller) {
                                          if (expanded) {
                                            controller.forward();
                                          } else {
                                            controller.reverse();
                                          }
                                        },
                                      )
                                      .slideX(
                                        begin: 0,
                                        end: -1.4,
                                        duration: 400.ms,
                                      ),
                                  ExpandedWidget(
                                    expand: expanded,
                                    child: MarkdownWidget(
                                      shrinkWrap: true,
                                      data: AppConstants.vsCodeConf,
                                      config: MarkdownConfig(
                                        configs: [
                                          PreConfig(
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF282a36),
                                              borderRadius:
                                                  BorderRadius.circular(10),
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
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        ConfigContainer(
                          child: ValueListenableBuilder(
                            valueListenable: isExpandedVsCodeExt,
                            builder: (_, expanded, __) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Extensões VSCode',
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
                                      const Spacer(),
                                      IconButton(
                                        onPressed: () async {
                                          if (kReleaseMode) {
                                            await FirebaseAnalytics.instance
                                                .logEvent(
                                                    name:
                                                        'VSCode Extensions Click');
                                          }
                                          isExpandedVsCodeExt.value =
                                              !isExpandedVsCodeExt.value;
                                        },
                                        icon: AnimatedRotation(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          turns: isExpandedVsCodeExt.value
                                              ? 0
                                              : 0.5,
                                          child: const Icon(
                                            Icons.expand_more,
                                            size: 30,
                                            color: AppColors.cornflowerBlue,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                          'Extensões do VSCode que eu mais uso no dia a dia.')
                                      .animate(
                                        target: expanded ? 1 : 0,
                                        onPlay: (controller) {
                                          if (expanded) {
                                            controller.forward();
                                          } else {
                                            controller.reverse();
                                          }
                                        },
                                      )
                                      .slideX(
                                        begin: 0,
                                        end: -1.4,
                                        duration: 400.ms,
                                      ),
                                  ExpandedWidget(
                                    expand: expanded,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF282a36),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      padding: const EdgeInsets.all(20),
                                      child: MarkdownWidget(
                                        shrinkWrap: true,
                                        data: AppConstants.extensionVsCode,
                                        config: MarkdownConfig(
                                          configs: [
                                            LinkConfig(
                                              style: GoogleFonts.firaCode(
                                                color: AppColors.blueChill,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            PreConfig(
                                              theme: draculaTheme,
                                              textStyle: GoogleFonts.firaCode(
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 1,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        ConfigContainer(
                          child: ValueListenableBuilder(
                            valueListenable: isExpandedGit,
                            builder: (_, expanded, __) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Configurações Git',
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      SvgPicture.asset(
                                        AppImages.git,
                                        width: 30,
                                        height: 30,
                                      ),
                                      const Spacer(),
                                      IconButton(
                                        onPressed: () async {
                                          if (kReleaseMode) {
                                            await FirebaseAnalytics.instance
                                                .logEvent(
                                                    name: 'Git Settings Click');
                                          }
                                          isExpandedGit.value =
                                              !isExpandedGit.value;
                                        },
                                        icon: AnimatedRotation(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          turns: isExpandedGit.value ? 0 : 0.5,
                                          child: const Icon(
                                            Icons.expand_more,
                                            size: 30,
                                            color: AppColors.cornflowerBlue,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                          'Aqui é minha configuração do git que uso e recomendo.')
                                      .animate(
                                        target: expanded ? 1 : 0,
                                        onPlay: (controller) {
                                          if (expanded) {
                                            controller.forward();
                                          } else {
                                            controller.reverse();
                                          }
                                        },
                                      )
                                      .slideX(
                                        begin: 0,
                                        end: -1.4,
                                        duration: 400.ms,
                                      ),
                                  ExpandedWidget(
                                    expand: expanded,
                                    child: MarkdownWidget(
                                      shrinkWrap: true,
                                      data: AppConstants.gitConfig,
                                      config: MarkdownConfig(
                                        configs: [
                                          PreConfig(
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF282a36),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            language: 'bash',
                                            theme: draculaTheme,
                                            textStyle: GoogleFonts.firaCode(
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 1,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        ConfigContainer(
                          child: ValueListenableBuilder(
                            valueListenable: isExpandedZshrc,
                            builder: (_, expanded, __) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '.zshrc',
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      SvgPicture.asset(AppImages.terminal,
                                          width: 30,
                                          height: 30,
                                          colorFilter: const ColorFilter.mode(
                                            AppColors.cornflowerBlue,
                                            BlendMode.srcIn,
                                          )),
                                      const Spacer(),
                                      IconButton(
                                        onPressed: () async {
                                          if (kReleaseMode) {
                                            await FirebaseAnalytics.instance
                                                .logEvent(
                                                    name:
                                                        'Zshrc Settings Click');
                                          }
                                          isExpandedZshrc.value =
                                              !isExpandedZshrc.value;
                                        },
                                        icon: AnimatedRotation(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          turns:
                                              isExpandedZshrc.value ? 0 : 0.5,
                                          child: const Icon(
                                            Icons.expand_more,
                                            size: 30,
                                            color: AppColors.cornflowerBlue,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                          'Configuração do meu .zshrc, que eu utilizo para deixar o terminal mais bonito e com algumas funcionalidades. Atualmente estou utilizando o oh-my-zsh com Hyper terminal.')
                                      .animate(
                                        target: expanded ? 1 : 0,
                                        onPlay: (controller) {
                                          if (expanded) {
                                            controller.forward();
                                          } else {
                                            controller.reverse();
                                          }
                                        },
                                      )
                                      .slideX(
                                        begin: 0,
                                        end: -1.4,
                                        duration: 400.ms,
                                      ),
                                  ExpandedWidget(
                                    expand: expanded,
                                    child: MarkdownWidget(
                                      shrinkWrap: true,
                                      data: AppConstants.zshConfig,
                                      config: MarkdownConfig(
                                        configs: [
                                          PreConfig(
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF282a36),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            language: 'bash',
                                            theme: draculaTheme,
                                            textStyle: GoogleFonts.firaCode(
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 1,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
