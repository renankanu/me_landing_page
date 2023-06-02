import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:me_landing_page/modules/home/sections/config/components/vs_code_container/vs_code_container.dart';

import '../../../../shared/utils/app_responsive.dart';
import '../../../../shared/widgets/app_title_section.dart';

class Config extends StatelessWidget {
  const Config({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final padding = width * 0.03;

    return Container(
      padding: const EdgeInsets.only(top: 80),
      child: LayoutBuilder(
        builder: (_, __) {
          return Center(
            child: Container(
              constraints: const BoxConstraints(minWidth: 1800),
              padding: globalPadding(context, padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const AppTitleSection(
                    title: 'Minha Config de Dev.',
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
                  const VsCodeContainer()
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
