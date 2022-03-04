import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:me_landing_page/app/core/colors.dart';
import 'package:me_landing_page/app/modules/home/views/sections/skills.dart';
import 'package:me_landing_page/app/modules/home/views/widgets/left_menu.dart';

import '../controllers/home_controller.dart';
import 'sections/about_me.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.vistaWhite,
      body: Stack(
        children: [
          const LeftMenu(),
          SingleChildScrollView(
            child: Column(
              children: const [
                AboutMe(),
                Skills(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
