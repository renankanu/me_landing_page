import 'package:flutter/material.dart';
import 'package:me_landing_page/shared/widgets/app_custom_image.dart';

class LanguagesGit extends StatelessWidget {
  const LanguagesGit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 165,
      width: 300,
      child: AppCustomImage(
          'https://github-readme-stats.vercel.app/api/top-langs/?username=renankanu&layout=compact&theme=dracula&locale=pt-br'),
    );
  }
}
