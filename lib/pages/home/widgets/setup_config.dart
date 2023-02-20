import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/utils/app_responsive.dart';
import '../../../shared/widgets/app_title_section.dart';

class SetupConfig extends StatelessWidget {
  const SetupConfig({Key? key}) : super(key: key);

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
            padding: EdgeInsets.fromLTRB(padding, 80, padding, 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: AppTitleSection(
                    title: 'Setup e Configurações',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Text(
                    'Aqui está algumas configurações que eu uso para desenvolver',
                    style: GoogleFonts.poppins(
                      color: Colors.white.withOpacity(0.7),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Text('Makefile'),
              ],
            ),
          ),
        );
      },
    );
  }
}
