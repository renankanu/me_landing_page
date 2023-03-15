import 'package:flutter/material.dart';

import '../../../../shared/widgets/app_custom_image.dart';

class ProfileGitInfoInfo extends StatelessWidget {
  const ProfileGitInfoInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 195,
      width: 467,
      child: AppCustomImage(
        'https://github-readme-stats.vercel.app/api?username=renankanu&show_icons=true&theme=dracula&locale=pt-br',
      ),
    );
  }
}
