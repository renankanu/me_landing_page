import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../shared/app_colors.dart';
import 'item_work_knowledge.dart';

class Knowledge extends StatelessWidget {
  const Knowledge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Aqui está o resumo de minha formação acadêmica e cursos.',
          style: GoogleFonts.poppins(
            color: Colors.white.withOpacity(0.7),
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 40),
        Stack(
          children: [
            Positioned(
              top: 0,
              left: 4,
              bottom: 0,
              child: Container(
                width: 2,
                decoration: const BoxDecoration(
                  color: AppColors.blueChill,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.blueChill,
                      blurRadius: 4,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  ItemWorkKnowledge(
                    title: 'Universidade Paranaense(UNIPAR) - 2015',
                    description: '- Análise e Desenvolvimento de Sistemas',
                  ),
                  ItemWorkKnowledge(
                    title: 'Udemy - 2021',
                    description:
                        '- Flutter utilizando TDD; \n- Clean Architecture; \n- Design Patterns; \n- SOLID;',
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
