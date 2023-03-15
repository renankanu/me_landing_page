import 'package:flutter/material.dart';

import '../../../../shared/widgets/app_custom_image.dart';

class ProfileGitInfoInfo extends StatelessWidget {
  const ProfileGitInfoInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      color: Colors.red,
      child: const AppCustomImage(
        'https://avatars.githubusercontent.com/u/16825387?v=4',
      ),
    );
  }
}
