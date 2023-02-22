import 'package:flutter/material.dart';
import 'package:me_landing_page/shared/app_images.dart';
import 'package:me_landing_page/shared/utils/app_responsive.dart';

import '../../../shared/app_colors.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.woodsmoke.withOpacity(0.2),
      child: LayoutBuilder(
        builder: (_, __) {
          if (Responsive.isMobile(context)) {}
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Logo(),
              Copyright(),
              Email(),
            ],
          );
        },
      ),
    );
  }
}

class Email extends StatelessWidget {
  const Email({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.email,
          color: Colors.white.withOpacity(0.7),
          size: 16,
        ),
        const SizedBox(width: 10),
        const Text('renankanu@gmail.com'),
      ],
    );
  }
}

class Copyright extends StatelessWidget {
  const Copyright({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Text(
            '© Copyright ${DateTime.now().year} | Renan Santos de Oliveira',
          ),
          const Text(
            'Feito com Flutter',
          ),
        ],
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.renankanu,
      height: 20,
      color: Colors.white.withOpacity(0),
    );
  }
}
