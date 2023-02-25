import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:me_landing_page/pages/home/components/about_me.dart';
import 'package:me_landing_page/pages/home/components/config.dart';
import 'package:me_landing_page/pages/home/components/footer.dart';
import 'package:me_landing_page/pages/home/components/jobs.dart';
import 'package:me_landing_page/pages/home/components/menu.dart';
import 'package:me_landing_page/pages/home/components/skills.dart';
import 'package:me_landing_page/shared/app_colors.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ItemScrollController();
  final _scrollListener = ItemPositionsListener.create();
  final _listSections = [
    const AboutMe(),
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
          ),
        ],
      ),
    );
  }
}
