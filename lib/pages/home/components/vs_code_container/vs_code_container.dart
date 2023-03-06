import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:me_landing_page/model/file_config.dart';
import 'package:me_landing_page/pages/home/components/vs_code_container/bottom_container.dart';
import 'package:me_landing_page/pages/home/components/vs_code_container/tab_file_name.dart';
import 'package:me_landing_page/pages/home/components/vs_code_container/top_container.dart';
import 'package:me_landing_page/shared/app_colors.dart';
import 'package:me_landing_page/shared/widgets/expanded_widget.dart';

import '../../../../shared/utils/app_responsive.dart';
import 'content_file.dart';
import 'navigation_files.dart';
import 'navigation_left.dart';

class VsCodeContainer extends StatelessWidget {
  const VsCodeContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final padding = width * 0.03;
    final fileSelected = ValueNotifier<FileConfig>(FileConfig.files[0]);
    final scrollController = ScrollController();
    final isMobile = Responsive.isMobile(context);
    return LayoutBuilder(
      builder: (_, constraints) {
        return Center(
          child: ValueListenableBuilder(
            valueListenable: fileSelected,
            builder: (_, fileConfig, __) => Container(
              constraints: const BoxConstraints(minWidth: 1800),
              padding: globalPadding(context, padding),
              color: AppColors.ebony.withOpacity(0.3),
              child: Container(
                decoration: !isMobile
                    ? BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        border: Border.all(
                          color: AppColors.tunaBorder,
                          width: 1,
                        ),
                      )
                    : null,
                child: !isMobile
                    ? Column(
                        children: [
                          const TopContainer(),
                          Container(
                            height: height,
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
                                NavigationFiles(
                                  height: height,
                                  scrollController: scrollController,
                                  fileSelected: fileSelected,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TabFileName(
                                        fileConfig: fileConfig,
                                      ),
                                      Expanded(
                                        child: ContentFile(
                                          scrollController: scrollController,
                                          fileConfig: fileConfig,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const BottomContainer()
                        ],
                      )
                    : MobileContainer(
                        fileSelected: fileSelected,
                        scrollController: scrollController,
                        fileConfig: fileConfig,
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class MobileContainer extends StatelessWidget {
  const MobileContainer({
    super.key,
    required this.fileSelected,
    required this.scrollController,
    required this.fileConfig,
  });

  final ValueNotifier<FileConfig> fileSelected;
  final ScrollController scrollController;
  final FileConfig fileConfig;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: FileConfig.files.map(
        (itemFile) {
          final isFirstItem = FileConfig.files.first == itemFile;
          final isLastItem = FileConfig.files.last == itemFile;
          return Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: itemFile == fileConfig
                  ? AppColors.woodsmoke
                  : AppColors.woodsmokeBorder,
              borderRadius: BorderRadius.vertical(
                top: isFirstItem ? const Radius.circular(8) : Radius.zero,
                bottom: isLastItem ? const Radius.circular(8) : Radius.zero,
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(itemFile.icon),
                    const SizedBox(width: 5),
                    Text(
                      itemFile.name,
                      style: GoogleFonts.sourceCodePro(
                        color: itemFile == fileConfig
                            ? AppColors.boulder
                            : AppColors.comet,
                        fontSize: 16,
                        fontWeight:
                            itemFile == fileConfig ? FontWeight.w600 : null,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        itemFile.isExpanded = !itemFile.isExpanded;
                        fileSelected.value = itemFile;
                      },
                      child: AnimatedRotation(
                        duration: const Duration(milliseconds: 300),
                        turns: fileConfig.isExpanded ? 0 : 0.5,
                        child: Icon(
                          Icons.expand_more,
                          color: fileConfig.isExpanded
                              ? Colors.white
                              : AppColors.comet,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                ExpandedWidget(
                  expand: fileConfig.isExpanded,
                  child: ContentFile(
                    scrollController: scrollController,
                    fileConfig: fileConfig,
                    isShrinkWrap: true,
                    scrollPhysics: const NeverScrollableScrollPhysics(),
                  ),
                )
              ],
            ),
          );
        },
      ).toList(),
    );
  }
}
