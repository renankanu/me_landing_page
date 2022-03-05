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
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 100,
          height: 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: BaseColors.burntSienna,
          ),
        ),
        const SizedBox(width: 40),
        SelectableText(
          title,
          style: Get.textTheme.headline2!.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 38,
          ),
        ),
        const SizedBox(width: 40),
        Container(
          width: 100,
          height: 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: BaseColors.burntSienna,
          ),
        )
      ],
    );
  }
}
