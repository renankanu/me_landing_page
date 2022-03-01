import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:me_landing_page/app/core/colors.dart';
import 'package:me_landing_page/app/modules/home/views/widgets/left_menu.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.vistaWhite,
      body: Container(
        constraints: BoxConstraints(maxWidth: 1440),
        child: Stack(
          children: [
            LeftMenu(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 184, vertical: 64),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Olá!',
                        style: Get.textTheme.headline1,
                      ),
                      Text(
                        'Olá!',
                      ),
                      Expanded(
                        child: Text(
                          "Eu sou Renan Santos.\nDev. Mobile.",
                          style: TextStyle(
                            fontSize: 62,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
