import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:me_landing_page/modules/home/sections/job/work.dart';
import 'package:me_landing_page/shared/app_colors.dart';
import 'package:me_landing_page/shared/utils/app_responsive.dart';
import 'package:me_landing_page/shared/widgets/app_title_section.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'knowledge.dart';

class Jobs extends StatelessWidget {
  const Jobs({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    double padding = width * 0.03;
    final start = ValueNotifier(false);

    return Container(
      color: AppColors.ebony.withOpacity(0.4),
      padding: const EdgeInsets.only(top: 80),
      child: LayoutBuilder(
        builder: (_, __) {
          return ValueListenableBuilder(
            valueListenable: start,
            builder: (_, started, __) {
              return Center(
                child: Container(
                  constraints: const BoxConstraints(minWidth: 1800),
                  padding: globalPadding(context, padding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppTitleSection(
                        title: 'Experiência Profissional',
                      ),
                      const SizedBox(height: 40),
                      if (Responsive.isMobile(context))
                        ContainerMobile(start: start, started: started)
                      else
                        WebContainer(start: start, started: started),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class WebContainer extends StatelessWidget {
  const WebContainer({
    super.key,
    required this.start,
    required this.started,
  });

  final ValueNotifier<bool> start;
  final bool started;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('jobs'),
      onVisibilityChanged: (visibilityInfo) {
        final visiblePercentage = visibilityInfo.visibleFraction * 100;
        if (visiblePercentage > 20) {
          start.value = true;
        }
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            child: Work(),
          )
              .animate(
                target: started ? 1.0 : 0.0,
                onPlay: (controller) {
                  if (started) {
                    controller.forward();
                  }
                },
              )
              .moveX(
                begin: -100,
                end: 0,
                duration: 1.seconds,
                curve: Curves.fastOutSlowIn,
              )
              .fadeIn(
                begin: 0,
              ),
          const SizedBox(width: 40),
          const Expanded(
            child: Knowledge(),
          )
              .animate(
                target: started ? 1.0 : 0.0,
                onPlay: (controller) {
                  if (started) {
                    controller.forward();
                  }
                },
              )
              .moveX(
                begin: 100,
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

class ContainerMobile extends StatelessWidget {
  const ContainerMobile({
    super.key,
    required this.start,
    required this.started,
  });

  final ValueNotifier<bool> start;
  final bool started;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('jobs'),
      onVisibilityChanged: (visibilityInfo) {
        final visiblePercentage = visibilityInfo.visibleFraction * 100;
        if (visiblePercentage > 10) {
          start.value = true;
        }
      },
      child: const Column(
        children: [
          Work(),
          SizedBox(height: 40),
          Knowledge(),
        ],
      )
          .animate(
            target: started ? 1.0 : 0.0,
            onPlay: (controller) {
              if (started) {
                controller.forward();
              }
            },
          )
          .moveX(
            begin: -100,
            end: 0,
            duration: 1.seconds,
            curve: Curves.fastOutSlowIn,
          )
          .fadeIn(
            begin: 0,
          ),
    );
  }
}
