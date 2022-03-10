import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/core.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      color: const Color(0xfff1f1f1),
      child: Visibility(
        visible: Responsive.isDesktop(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  BaseImages.icMail,
                  height: 20,
                ),
                const SizedBox(width: 10),
                const SelectableText('renankanu@gmail.com'),
              ],
            ),
            Text(
              '© Copyright 2021 | Renan Santos de Oliveira',
              style: Get.textTheme.headline5!.copyWith(
                color: BaseColors.mineShaft,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  BaseImages.icMail,
                  height: 20,
                ),
                const SizedBox(width: 10),
                const SelectableText('renankanu@gmail.com'),
              ],
            ),
          ],
        ),
        replacement: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  BaseImages.icMail,
                  height: 20,
                ),
                const SizedBox(width: 10),
                const SelectableText('renankanu@gmail.com'),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              '© Copyright 2021 | Renan Santos de Oliveira',
              style: Get.textTheme.headline5!.copyWith(
                color: BaseColors.mineShaft,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  BaseImages.icMail,
                  height: 20,
                ),
                const SizedBox(width: 10),
                const SelectableText('renankanu@gmail.com'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
