import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/dracula.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:me_landing_page/pages/home/components/vs_code_container/top_container.dart';
import 'package:me_landing_page/shared/app_colors.dart';
import 'package:me_landing_page/shared/app_constants.dart';
import 'package:me_landing_page/shared/app_images.dart';

import '../../../../shared/utils/app_responsive.dart';
import 'item_file.dart';
import 'navigation_left.dart';

class VsCodeContainer extends StatelessWidget {
  const VsCodeContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final padding = width * 0.03;
    return LayoutBuilder(
      builder: (_, constraints) {
        return Center(
          child: Container(
            constraints: const BoxConstraints(minWidth: 1800),
            padding: globalPadding(context, padding),
            color: AppColors.ebony.withOpacity(0.3),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.riverBed,
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
                border: Border.all(
                  color: AppColors.tunaBorder,
                  width: 1,
                ),
              ),
              child: Column(
                children: [
                  const TopContainer(),
                  Container(
                    height: 600,
                    decoration: const BoxDecoration(
                      color: AppColors.steelGray,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                    child: Row(
                      children: [
                        const NavigationLeft(),
                        Container(
                          height: 600,
                          width: 200,
                          decoration: const BoxDecoration(
                            color: AppColors.woodsmoke,
                            border: Border(
                              right: BorderSide(
                                color: AppColors.woodsmokeBorder,
                                width: 1,
                              ),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  right: 10,
                                  top: 12,
                                  bottom: 12,
                                ),
                                child: Row(
                                  children: const [
                                    Text(
                                      'EXPLORER',
                                      style: TextStyle(
                                        color: AppColors.comet,
                                        fontSize: 10,
                                      ),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.more_horiz,
                                      color: AppColors.comet,
                                      size: 12,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, bottom: 8),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.chevron_right_outlined,
                                      color: Color(0xFFAAB1D3),
                                      size: 16,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      'OPEN EDITORS',
                                      style: GoogleFonts.roboto(
                                        color: const Color(0xFFAAB1D3),
                                        fontWeight: FontWeight.w900,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                color: AppColors.woodsmokeBorder,
                                thickness: 1,
                                height: 0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8, top: 8),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.expand_more_outlined,
                                      color: Color(0xFFAAB1D3),
                                      size: 16,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      'MY_CONFIGS ',
                                      style: GoogleFonts.roboto(
                                        color: const Color(0xFFAAB1D3),
                                        fontWeight: FontWeight.w900,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 24,
                                  top: 8,
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.expand_more_outlined,
                                      color: Color(0xFFAAB1D3),
                                      size: 16,
                                    ),
                                    const SizedBox(width: 8),
                                    SvgPicture.asset(
                                      AppImages.folderConfig,
                                      width: 16,
                                      height: 16,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      'config',
                                      style: GoogleFonts.roboto(
                                        color: const Color(0xFFAAB1D3),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const ItemFile(
                                icon: AppImages.makefile,
                                nameFile: 'Makefile',
                              ),
                              const ItemFile(
                                icon: AppImages.json,
                                nameFile: 'settings.json',
                              ),
                              const ItemFile(
                                icon: AppImages.git,
                                nameFile: '.gitconfig',
                              ),
                              const ItemFile(
                                icon: AppImages.console,
                                nameFile: '.zshrc',
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            physics: const ClampingScrollPhysics(),
                            child: HighlightView(
                              AppConstants.makeFileConf,
                              language: 'makefile',
                              theme: draculaTheme,
                              padding: const EdgeInsets.all(20),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
