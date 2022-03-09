import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/core.dart';
import '../../../../core/section_keys.dart';
import '../../../../core/widgets/base_title_section.dart';
import '../../../../data/model/item_experience_education.dart';

class Experience extends StatelessWidget {
  const Experience({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      key: SectionKeys.experience,
      child: Column(
        children: [
          const BaseTitleSection(title: 'Meu Resumo'),
          const SizedBox(height: 10),
          SelectableText(
            'Aqui está um resumo sobre as minhas experiências que obtive nessa jornada de desenvolvimento e também sobre o que eu aprendi durante a minha carreira profissional.',
            style: Get.textTheme.bodyMedium!.copyWith(),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),
          Visibility(
            visible: !Responsive.isMobile(context),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ContainerExperience(
                    title: 'EXPERIÊNCIA DE TRABALHO',
                    itemExperienceEducation: _generateWorkList(),
                  ),
                ),
                Expanded(
                  child: ContainerExperience(
                    title: 'FORMAÇÃO E CURSOS',
                    itemExperienceEducation: _generateEducationList(),
                  ),
                ),
              ],
            ),
            replacement: Column(
              children: [
                ContainerExperience(
                  title: 'EXPERIÊNCIA DE TRABALHO',
                  itemExperienceEducation: _generateWorkList(),
                ),
                const SizedBox(height: 20),
                ContainerExperience(
                  title: 'FORMAÇÃO E CURSOS',
                  itemExperienceEducation: _generateEducationList(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          SelectableText(
            'Nas horas vagas, eu estou estudando sobre Clean Architecture e TDD em Flutter com o objetivo de ter códigos com qualidade, boa manutenção e testáveis, Animações e UI responsivas, e também estou estudando sobre Flutter Web.',
            style: Get.textTheme.bodyMedium!.copyWith(),
          ),
        ],
      ),
    );
  }

  List<ItemExperienceEducation> _generateWorkList() {
    final List<ItemExperienceEducation> workExperienceList = [];
    workExperienceList.add(
      ItemExperienceEducation(
        title: 'Megaleios',
        period: 'Setembro de 2019 - Atual',
        description:
            '- Desenvolvimento com Flutter; \n- Modular(gerência de dependências, rotas); \n- Bloc, RxDart, GetX; \n- Integração com Firebase; \n- Integração com OneSignal; \n- Publicar App nas lojas(Apple e GooglePlay); \n- CD com Bitrise; \n- Integração com APIs REST; \n- Visionamento de código com git; \n- Desenvolvimento com React Native;',
      ),
    );
    workExperienceList.add(
      ItemExperienceEducation(
        title: 'Sisterra',
        period: 'Novembro de 2015 - Setembro de 2019',
        description:
            '- Desenvolvimento de aplicativos para Android nativo (Java e Kotlin); \n- Desenvolvimento de aplicações em PHP utilizando DDD para back-end; \n- APIs REST; \n- CQRS pattern; \n- Conhecimento em Docker; \n- Publicar App nas lojas(Apple e GooglePlay); \n- Conhecimento em AWS (Lambda, SNS, SQS, SES, EC2, RDS, S3); \n- Integração com APIs REST; \n- Usuário Linux (GNU / Linux Ubuntu);',
      ),
    );
    return workExperienceList;
  }

  List<ItemExperienceEducation> _generateEducationList() {
    final List<ItemExperienceEducation> educationList = [];
    educationList.add(
      ItemExperienceEducation(
        title: 'Universidade Paranaense(UNIPAR)',
        period: 'Dezembro de 2015',
        description: '- Análise e Desenvolvimento de Sistemas;',
      ),
    );
    educationList.add(
      ItemExperienceEducation(
        title: 'Udemy',
        period: 'Outubro de 2021',
        description:
            '- Flutter utilizando TDD;\n- Clean Architecture;\n - Design Patterns;\n- SOLID;',
      ),
    );
    return educationList;
  }
}

class ContainerExperience extends StatelessWidget {
  const ContainerExperience({
    Key? key,
    required this.title,
    required this.itemExperienceEducation,
  }) : super(key: key);

  final String title;
  final List<ItemExperienceEducation> itemExperienceEducation;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Get.textTheme.headline6!.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 10),
          height: 4,
          width: 100,
          color: BaseColors.burntSienna,
        ),
        const SizedBox(height: 40),
        Stack(
          children: [
            Positioned(
              left: 6,
              top: 0,
              bottom: 0,
              child: Container(
                width: 2,
                color: BaseColors.burntSienna,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...itemExperienceEducation
                    .map(
                      (item) => ItemXpEducation(
                        titleItem: item.title,
                        period: item.period,
                        xps: item.description,
                      ),
                    )
                    .toList(),
              ],
            ),
          ],
        )
      ],
    );
  }
}

class ItemXpEducation extends StatelessWidget {
  const ItemXpEducation({
    Key? key,
    required this.titleItem,
    required this.period,
    required this.xps,
  }) : super(key: key);

  final String titleItem;
  final String period;
  final String xps;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 14,
            width: 14,
            margin: const EdgeInsets.only(top: 10),
            decoration: const BoxDecoration(
              color: BaseColors.ebonyClay,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Container(
                height: 7,
                width: 7,
                decoration: const BoxDecoration(
                  color: BaseColors.burntSienna,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 16),
            height: 2,
            width: 8,
            color: BaseColors.burntSienna,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                    color: BaseColors.burntSienna,
                  ),
                  child: Text(
                    period,
                    style: Get.textTheme.bodyText2!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  titleItem,
                  style: Get.textTheme.bodyText2!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  xps,
                  style: Get.textTheme.bodyText2!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
