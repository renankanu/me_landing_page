import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/core.dart';
import '../../../../core/widgets/base_title_section.dart';

class Experience extends StatelessWidget {
  const Experience({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
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
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'EXPERIÊNCIA DE TRABALHO',
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
                    Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          bottom: 0,
                          child: Container(
                            width: 2,
                            height: double.maxFinite,
                            color: Colors.amber,
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 14,
                                  width: 14,
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
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Desenvolvedor Mobile',
                                        style:
                                            Get.textTheme.bodyText2!.copyWith(
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        'São Paulo - SP',
                                        style:
                                            Get.textTheme.bodyText2!.copyWith(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  '2020',
                                  style: Get.textTheme.bodyText2!.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Text('EDUCAÇÃO E DIPLOMAS.'),
            ],
          )
        ],
      ),
    );
  }
}
