import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:me_landing_page/model/my_app.dart';

import '../../../../../shared/app_colors.dart';
import '../../../../../shared/utils/app_responsive.dart';
import '../../../../../shared/widgets/app_title_section.dart';
import 'item_app.dart';

class ListApp extends StatelessWidget {
  const ListApp({
    super.key,
    required this.myApps,
  });

  final List<MyApp> myApps;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    double padding = width * 0.03;
    return Container(
      color: AppColors.ebony.withOpacity(0.7),
      padding: const EdgeInsets.only(top: 80),
      child: Container(
        constraints: const BoxConstraints(minWidth: 1800),
        padding: globalPadding(context, padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppTitleSection(title: 'Meus Apps'),
            const SizedBox(height: 20),
            Text(
              'Esses são alguns dos meus apps que estão na loja do Google Play e App Store.',
              style: GoogleFonts.poppins(
                color: Colors.white.withOpacity(0.7),
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 40),
            ...myApps.map((app) => ItemApp(myApp: app)),
          ],
        ),
      ),
    );
  }
}
