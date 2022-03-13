import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        key: _scaffoldKey,
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
                    _scaffoldKey.currentState!.openDrawer();
                  },
                ),
              )
            : null,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: const [
                  AboutMe(),
                  Skills(),
                  Repo(),
                  Experience(),
                  Footer(),
                ],
              ),
            ),
            Visibility(
              visible: Responsive.isDesktop(),
              child: BaseSlideAnimation(child: LeftMenu()),
            ),
          ],
        ),
        drawer: LeftMenu(),
      );
    });
  }
}
