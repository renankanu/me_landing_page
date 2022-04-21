import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core.dart';

class BaseTitleSection extends StatelessWidget {
  const BaseTitleSection({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const DividerUITitle(),
            SizedBox(width: Responsive.isDesktop() ? 40 : 20),
            Text(
              title,
              style: Get.textTheme.headline2!.copyWith(
                fontWeight: FontWeight.w600,
                color: BaseColors.mineShaft,
                fontSize: Responsive.isDesktop() ? 38 : 24,
              ),
            ),
            SizedBox(width: Responsive.isDesktop() ? 40 : 20),
            const DividerUITitle(),
          ],
        );
      },
    );
  }
}

class DividerUITitle extends StatelessWidget {
  const DividerUITitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Responsive.isDesktop() ? 100 : 70,
      height: 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: BaseColors.burntSienna,
      ),
    );
  }
}
