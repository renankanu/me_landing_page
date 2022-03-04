import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:me_landing_page/app/core/colors.dart';
import 'package:me_landing_page/app/modules/home/views/sections/skills.dart';
import 'package:me_landing_page/app/modules/home/views/widgets/left_menu.dart';

import '../controllers/home_controller.dart';
import 'sections/about_me.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.vistaWhite,
      body: Container(
        child: Stack(
          children: [
            LeftMenu(),
            SingleChildScrollView(
              child: Column(
                children: [
                  AboutMe(),
                  Skills(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
