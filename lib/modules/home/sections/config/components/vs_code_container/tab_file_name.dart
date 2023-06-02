import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../model/file_config.dart';
import '../../../../../../shared/app_colors.dart';

class TabFileName extends StatelessWidget {
  const TabFileName({
    super.key,
    required this.fileConfig,
  });

  final FileConfig fileConfig;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 10,
        right: 8,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFF43589C),
            width: 1,
          ),
          right: BorderSide(
            color: AppColors.woodsmokeBorder,
            width: 1,
          ),
        ),
      ),
      height: 36,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            fileConfig.icon,
            width: 16,
            height: 16,
          ),
          const SizedBox(width: 6),
          Text(
            fileConfig.name,
            style: GoogleFonts.roboto(
              color: AppColors.comet,
              fontSize: 12,
            ),
          ),
          const SizedBox(width: 14),
          const Icon(
            Icons.close,
            color: AppColors.comet,
            size: 16,
          ),
        ],
      ),
    );
  }
}
