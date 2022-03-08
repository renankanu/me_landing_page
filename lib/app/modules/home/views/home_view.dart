import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/colors.dart';
import '../../../core/responsive.dart';
import '../controllers/home_controller.dart';
import 'sections/about_me.dart';
import 'sections/experience.dart';
import 'sections/repo.dart';
import 'sections/skills.dart';
import 'widgets/left_menu.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.vistaWhite,
      appBar: !Responsive.isDesktop(context)
          ? AppBar(
              backgroundColor: BaseColors.ebonyClay,
              elevation: 0,
              actions: [
                IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {},
                ),
              ],
            )
          : null,
      body: Stack(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  AboutMe(),
                  Skills(),
                  Repo(),
                  Experience(),
                ],
              ),
            ),
          ),
          Visibility(
            visible: Responsive.isDesktop(context),
            child: LeftMenu(),
          ),
        ],
      ),
    );
  }
}
