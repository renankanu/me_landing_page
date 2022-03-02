import 'package:flutter/material.dart';
import 'package:me_landing_page/app/core/colors.dart';

class LeftMenu extends StatelessWidget {
  const LeftMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 683,
      width: 84,
      decoration: BoxDecoration(
        color: BaseColors.ebonyClay,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
    );
  }
}
