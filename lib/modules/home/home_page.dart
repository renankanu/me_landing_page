import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:me_landing_page/modules/home/sections/about_me/about_me.dart';
import 'package:me_landing_page/modules/home/sections/config/config.dart';
import 'package:me_landing_page/modules/home/sections/footer/footer.dart';
import 'package:me_landing_page/modules/home/sections/job/jobs.dart';
import 'package:me_landing_page/modules/home/sections/menu/menu.dart';
import 'package:me_landing_page/modules/home/sections/my_apps/my_apps.dart';
import 'package:me_landing_page/modules/home/sections/skill/skills.dart';
import 'package:me_landing_page/shared/app_colors.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ItemScrollController();
  final _scrollListener = ItemPositionsListener.create();
  final _listSections = [
    const AboutMe(),
    const MyApps(),
    const Skills(),
    const Config(),
    const Jobs(),
    const Footer(),
  ];

  void scrollToIndex(int index) {
    _scrollController.scrollTo(
      index: index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
      alignment: 0.15,
    );
  }

  @override
  void initState() {
    if (kReleaseMode) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        FirebaseAnalytics.instance.logAppOpen();
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ebonyClay,
      body: Stack(
        children: [
          ScrollablePositionedList.builder(
            itemScrollController: _scrollController,
            itemPositionsListener: _scrollListener,
            itemCount: _listSections.length,
            itemBuilder: (_, index) {
              return _listSections[index];
            },
          ),
          Menu(
            onSelected: (index) {
              scrollToIndex(index);
            },
          )
              .animate()
              .moveY(
                begin: -30,
                end: 0,
                duration: 1.seconds,
                curve: Curves.fastOutSlowIn,
              )
              .fadeIn(
                begin: 0,
              ),
        ],
      ),
    );
  }
}
