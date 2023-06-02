import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../shared/app_colors.dart';
import 'item_work_knowledge.dart';

class Work extends StatelessWidget {
  const Work({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Aqui está o resumo de minha experiência profissional.',
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
                    title: 'Megaleios - 2019 até o momento',
                    description:
                        '- Desenvolvimento com Flutter; \n- Modular(gerência de dependências, rotas); \n- Bloc, RxDart, GetX; \n- Integração com Firebase; \n- Integração com OneSignal; \n- Figma; \n- Publicar App nas lojas(Apple e GooglePlay); \n- CD com Bitrise; \n- Integração com APIs REST; \n-Clean Architecture; \n-TDD; \n- Visionamento de código com git; \n- Desenvolvimento com React Native;',
                  ),
                  ItemWorkKnowledge(
                    title: 'Sisterra - 2015 até 2019',
                    description:
                        '- Desenvolvimento de aplicativos para Android nativo (Java e Kotlin); \n- Desenvolvimento de aplicações em PHP utilizando DDD para back-end; \n- APIs REST; \n- CQRS pattern; \n- Conhecimento em Docker; \n- Publicar App nas lojas(Apple e GooglePlay); \n- Conhecimento em AWS (Lambda, SNS, SQS, SES, EC2, RDS, S3); \n- Integração com APIs REST; \n- Usuário Linux (GNU / Linux Ubuntu);',
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
