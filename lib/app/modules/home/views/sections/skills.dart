import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/core.dart';

class Skills extends StatelessWidget {
  const Skills({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Minhas Skills',
                style: Get.textTheme.headline2!.copyWith(
                  fontSize: 38,
                ),
              ),
              const SizedBox(width: 40),
              Container(
                width: 200,
                height: 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: BaseColors.burntSienna,
                ),
              )
            ],
          ),
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: BaseColors.burntSienna,
              boxShadow: [
                BoxShadow(
                  color: BaseColors.ebonyClay.withOpacity(0.5),
                  blurRadius: 10,
                  offset: const Offset(0, 10),
                ),
              ],
              border: Border.all(
                color: BaseColors.ebonyClay,
                width: 2,
              ),
            ),
          )
        ],
      ),
    );
  }
}
