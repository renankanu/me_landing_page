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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              ItemCardSkill(),
              ItemCardSkill(),
              ItemCardSkill(),
            ],
          ),
        ],
      ),
    );
  }
}

class ItemCardSkill extends StatelessWidget {
  const ItemCardSkill({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(10),
        color: BaseColors.vistaWhite,
        boxShadow: [
          BoxShadow(
            color: BaseColors.ebonyClay.withOpacity(0.5),
            blurRadius: 10,
            offset: const Offset(4, 4),
          ),
        ],
        border: const Border(
          left: BorderSide(
            color: BaseColors.ebonyClay,
            width: 4,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          FlutterLogo(size: 80),
          Text('Flutter'),
          Text('Flutter'),
        ],
      ),
    );
  }
}
