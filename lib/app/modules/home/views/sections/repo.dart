import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../../core/core.dart';
import '../../../../core/section_keys.dart';
import '../../../../core/utils/date_format_util.dart';
import '../../../../core/widgets/base_title_section.dart';
import '../../controllers/home_controller.dart';

class Repo extends StatelessWidget {
  const Repo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return VisibilityDetector(
      key: UniqueKey(),
      onVisibilityChanged: (visibility) {
        final visiblePercentage = visibility.visibleFraction * 100;
        if (visiblePercentage >= 15) {
          controller.selectedIndex = 2;
        }
      },
      child: BaseContainer(
        key: SectionKeys.repositories,
        child: Column(
          children: [
            const BaseTitleSection(title: 'Repositórios'),
            const SizedBox(height: 10),
            SelectableText(
              'Esses são alguns dos meus repositórios do GitHub',
              style: Get.textTheme.bodyMedium!.copyWith(),
            ),
            const SizedBox(height: 60),
            Query(
              options: QueryOptions(document: gql(pinnedQuery)),
              builder: (
                QueryResult result, {
                VoidCallback? refetch,
                FetchMore? fetchMore,
              }) {
                if (result.hasException) {
                  return Text(
                    'Opps! Algo deu errado!',
                    style: Get.textTheme.headline2,
                  );
                }
                if (result.isLoading) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Carregando...'),
                      SizedBox(width: 10),
                      CircularProgressIndicator(
                        strokeWidth: 4,
                        color: BaseColors.ebonyClay,
                      ),
                    ],
                  );
                }
                if (result.data != null) {
                  final repositoriesPinned =
                      result.data!['viewer']['pinnedItems']['nodes'] as List;
                  return Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: Column(
                      children: [
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: repositoriesPinned.map((repository) {
                            return Container(
                              constraints: BoxConstraints(
                                maxWidth: Responsive.isDesktop() ? 400 : 480,
                              ),
                              child: Card(
                                shadowColor: BaseColors.ebonyClay,
                                elevation: 5,
                                color: BaseColors.trout,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                    horizontal: 20,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        repository['name'].toString(),
                                        style:
                                            Get.textTheme.bodyText1!.copyWith(
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      SizedBox(
                                        height: 40,
                                        child: Text(
                                          repository['description'].toString(),
                                          style:
                                              Get.textTheme.bodyText2!.copyWith(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 18),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                width: 14,
                                                height: 14,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(20),
                                                  ),
                                                  color: HexColor(
                                                    repository['primaryLanguage']
                                                            ['color']
                                                        .toString(),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              Text(
                                                repository['primaryLanguage']
                                                        ['name']
                                                    .toString(),
                                                style: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(0.8),
                                                  fontSize: 11,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(
                                                BaseImages.icCalendar,
                                                height: 18,
                                              ),
                                              const SizedBox(width: 8),
                                              Text(
                                                DateFormateUtils
                                                    .converterDateWithHours(
                                                  repository['updatedAt']
                                                      .toString(),
                                                ),
                                                style: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(0.8),
                                                  fontSize: 11,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 60),
                        SizedBox(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'GitHub status',
                                    style: Get.textTheme.headline5!.copyWith(),
                                  ),
                                  const SizedBox(width: 10),
                                  Image.asset(
                                    BaseImages.icGithubStatus,
                                    height: 20,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    'https://github-readme-stats.vercel.app/api/top-langs/?username=renankanu&layout=compact&theme=dracula&bg_color=4D4E5D&locale=pt-BR&title_color=ED595D&card_width=446',
                                  ),
                                  const SizedBox(height: 10),
                                  Image.network(
                                    'https://github-readme-stats.vercel.app/api?username=renankanu&count_private=true&show_icons=true&theme=dracula&bg_color=4D4E5D&locale=pt-BR&title_color=ED595D&hide_title=true&card_width=400',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            )
          ],
        ),
      ),
    );
  }
}
