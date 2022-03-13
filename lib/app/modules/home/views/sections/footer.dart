import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/core.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          color: const Color(0xfff1f1f1),
          child: Visibility(
            visible: Responsive.isDesktop(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Logo(),
                Copyright(),
                Email(),
              ],
            ),
            replacement: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Logo(),
                Copyright(),
                Email(),
              ],
            ),
          ),
        );
      },
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
      children: [
        Image.asset(
          BaseImages.icMail,
          height: 20,
        ),
        const SizedBox(width: 10),
        const SelectableText('renankanu@gmail.com'),
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
      child: Text(
        '© Copyright ${DateTime.now().year} | Renan Santos de Oliveira',
        style: Get.textTheme.headline5!.copyWith(
          color: BaseColors.mineShaft,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
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
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          BaseImages.renankanu,
          height: 20,
        ),
      ],
    );
  }
}
