import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:me_landing_page/model/file_config.dart';
import 'package:me_landing_page/modules/home/sections/config/components/vs_code_container/bottom_container.dart';
import 'package:me_landing_page/modules/home/sections/config/components/vs_code_container/tab_file_name.dart';
import 'package:me_landing_page/modules/home/sections/config/components/vs_code_container/top_container.dart';
import 'package:me_landing_page/shared/app_colors.dart';
import 'package:me_landing_page/shared/widgets/expanded_widget.dart';

import '../../../../../../shared/utils/app_responsive.dart';
import 'content_file.dart';
import 'item_config.dart';
import 'navigation_files.dart';
import 'navigation_left.dart';

class VsCodeContainer extends StatelessWidget {
  const VsCodeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final fileSelected = ValueNotifier<FileConfig>(FileConfig.files[0]);
    final scrollController = ScrollController();
    final isMobile = Responsive.isMobile(context);
    return LayoutBuilder(
      builder: (_, constraints) {
        if (!isMobile) {
          return Center(
            child: ValueListenableBuilder(
              valueListenable: fileSelected,
              builder: (_, fileConfig, __) => Container(
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
                  child: Column(
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                  )),
            ),
          );
        }
        return MobileContainer(
          scrollController: scrollController,
        );
      },
    );
  }
}

class MobileContainer extends StatelessWidget {
  const MobileContainer({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ItemConfig.listConfigs,
      builder: (_, listConfig, __) => Column(
        children: listConfig.map(
          (itemFile) {
            final isFirstItem = FileConfig.files.first == itemFile;
            final isLastItem = FileConfig.files.last == itemFile;
            return Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: itemFile.isExpanded
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
                          color: itemFile.isExpanded
                              ? AppColors.boulder
                              : AppColors.comet,
                          fontSize: 16,
                          fontWeight:
                              itemFile.isExpanded ? FontWeight.w600 : null,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          ItemConfig.changeValueExpanded(itemFile);
                        },
                        child: AnimatedRotation(
                          duration: const Duration(milliseconds: 300),
                          turns: itemFile.isExpanded ? 0 : 0.5,
                          child: Icon(
                            Icons.expand_more,
                            color: itemFile.isExpanded
                                ? Colors.white
                                : AppColors.comet,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  ExpandedWidget(
                    expand: itemFile.isExpanded,
                    child: ContentFile(
                      scrollController: scrollController,
                      fileConfig: itemFile,
                      isShrinkWrap: true,
                      scrollPhysics: const NeverScrollableScrollPhysics(),
                    ),
                  )
                ],
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
