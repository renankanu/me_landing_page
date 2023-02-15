import 'package:flutter/material.dart';
import 'package:me_landing_page/shared/app_colors.dart';
import 'package:me_landing_page/shared/app_images.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.ebonyClay,
      child: Stack(
        children: [
          Image.asset(
            AppImages.bg,
            fit: BoxFit.cover,
            color: const Color(0xFFe5e7eb),
          ),
          const Center(
            child: Text(
              'About Me',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
