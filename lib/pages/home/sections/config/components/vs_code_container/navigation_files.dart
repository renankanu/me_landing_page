import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../model/file_config.dart';
import '../../../../../../shared/app_colors.dart';
import '../../../../../../shared/app_images.dart';
import 'item_file.dart';

class NavigationFiles extends StatelessWidget {
  const NavigationFiles({
    super.key,
    required this.height,
    required this.scrollController,
    required this.fileSelected,
  });

  final double height;
  final ScrollController scrollController;
  final ValueNotifier<FileConfig> fileSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
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
              children: [
                Text(
                  'EXPLORER',
                  style: GoogleFonts.roboto(
                    color: AppColors.comet,
                    fontSize: 10,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.more_horiz,
                  color: AppColors.comet,
                  size: 12,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 8),
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
          ...FileConfig.files.map(
            (fileConfig) => ItemFile(
              icon: fileConfig.icon,
              nameFile: fileConfig.name,
              onTap: () {
                scrollController.jumpTo(0);
                fileSelected.value = fileConfig;
              },
            ),
          ),
        ],
      ),
    );
  }
}
