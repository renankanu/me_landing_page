import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../core/animations.dart';
import '../../../core/colors.dart';
import '../../../core/images.dart';
import '../../../core/responsive.dart';
import '../controllers/home_controller.dart';
import 'sections/about_me.dart';
import 'sections/experience.dart';
import 'sections/footer.dart';
import 'sections/repo.dart';
import 'sections/skills.dart';
import 'widgets/left_menu.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final _myListSection = [
    const AboutMe(),
    const Skills(),
    const Repo(),
    const Experience(),
    const Footer(),
  ];
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: BaseColors.vistaWhite,
          drawerEnableOpenDragGesture: false,
          appBar: !Responsive.isDesktop()
              ? AppBar(
                  backgroundColor: BaseColors.ebonyClay,
                  elevation: 0,
                  leading: IconButton(
                    icon: Image.asset(
                      BaseImages.icMenu,
                      width: 24,
                    ),
                    onPressed: () {
                      scaffoldKey.currentState!.openDrawer();
                    },
                  ),
                )
              : null,
          body: Stack(
            children: [
              ScrollablePositionedList.builder(
                itemScrollController: controller.scrollController,
                itemCount: _myListSection.length,
                minCacheExtent: 10,
                itemBuilder: (context, index) {
                  return _myListSection[index];
                },
              ),
              Visibility(
                visible: Responsive.isDesktop(),
                child: BaseSlideAnimation(child: LeftMenu()),
              ),
            ],
          ),
          drawer: LeftMenu(),
        );
      },
    );
  }
}
