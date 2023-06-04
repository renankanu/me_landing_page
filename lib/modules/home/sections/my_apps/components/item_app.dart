import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_landing_page/model/my_app.dart';
import 'package:me_landing_page/shared/app_images.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../shared/utils/app_responsive.dart';

class ItemApp extends StatelessWidget {
  const ItemApp({
    super.key,
    required this.myApp,
  });

  final MyApp myApp;

  Color get textColor {
    if (myApp.color == 0) {
      return Colors.white;
    }
    return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return LayoutBuilder(builder: (_, constraints) {
      final isMobile = Responsive.isMobile(context);
      return Stack(
        children: [
          Positioned.fill(
            child: CachedNetworkImage(
              width: width,
              height: 500,
              imageUrl: myApp.background,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: width,
            padding: const EdgeInsets.all(40),
            child: isMobile
                ? Column(
                    children: [
                      CachedNetworkImage(
                        imageUrl: myApp.image,
                        height: 500,
                      ),
                      DescApp(
                        myApp: myApp,
                        textColor: textColor,
                      )
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: DescApp(
                          myApp: myApp,
                          textColor: textColor,
                        ),
                      ),
                      Expanded(
                        child: CachedNetworkImage(
                          imageUrl: myApp.image,
                          height: 500,
                        ),
                      )
                    ],
                  ),
          ),
        ],
      );
    });
  }
}

class DescApp extends StatelessWidget {
  const DescApp({
    super.key,
    required this.myApp,
    required this.textColor,
  });

  final MyApp myApp;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          myApp.name,
          style: TextStyle(
            color: textColor,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          myApp.description,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 20),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () async {
              final url = Uri.parse(myApp.googleUrl);
              await launchUrl(url);
            },
            child: SvgPicture.asset(
              AppImages.googlePlayBadge,
              width: 200,
            ),
          ),
        ),
      ],
    );
  }
}
