import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:me_landing_page/shared/widgets/app_title_section.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../shared/app_colors.dart';
import '../../../../shared/utils/app_responsive.dart';

class MyApps extends StatefulWidget {
  const MyApps({super.key});

  @override
  State<MyApps> createState() => _MyAppsState();
}

class _MyAppsState extends State<MyApps> {
  final supabase = Supabase.instance.client;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
            const Text('My Apps'),
          ],
        ),
      ),
    );
  }
}
