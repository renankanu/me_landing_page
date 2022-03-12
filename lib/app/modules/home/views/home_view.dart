import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

import '../../../core/core.dart';
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
    return Obx(
      () => Visibility(
        visible: controller.isLoading,
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxHeight: 200),
            child: const RiveAnimation.asset(
              'assets/animations/r.riv',
            ),
          ),
        ),
        replacement: Scaffold(
          key: _scaffoldKey,
          backgroundColor: BaseColors.vistaWhite,
          drawerEnableOpenDragGesture: false,
          appBar: !Responsive.isDesktop(context)
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
              SizedBox(
                width: double.maxFinite,
                child: SingleChildScrollView(
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
              ),
              Visibility(
                visible: Responsive.isDesktop(context),
                child: LeftMenu(),
              ),
            ],
          ),
          drawer: !Responsive.isDesktop(context) ? LeftMenu() : null,
        ),
      ),
    );
  }
}
