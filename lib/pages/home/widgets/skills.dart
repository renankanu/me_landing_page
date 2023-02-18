import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/utils/app_responsive.dart';

class Skills extends StatelessWidget {
  const Skills({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final padding = width * 0.03;
    ScrollController scrollController = ScrollController();

    return LayoutBuilder(builder: (_, constraints) {
      if (Responsive.isMobile(context)) {
        return Container(
          height: 100,
          width: 100,
          color: Colors.green,
        );
      }
      if (Responsive.isTablet(context)) {
        return Container(
          height: 100,
          width: 100,
          color: Colors.red,
        );
      }
      return Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(padding, 80, padding, 80),
          child: Column(
            children: [
              Text(
                'Minhas Skills',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 60,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 3,
                ),
              ),
              SizedBox(
                height: 100,
                child: Stack(
                  children: [
                    ListView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: scrollController,
                      itemCount: 17,
                      itemBuilder: (context, index) {
                        final color = Colors.primaries[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          height: 100,
                          width: 100,
                          color: color,
                        );
                      },
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: () {
                          scrollController.animateTo(
                            scrollController.offset - 700,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () {
                          scrollController.animateTo(
                            scrollController.offset + 700,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    'Flutter',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 3,
                    ),
                  ),
                  Text(
                    'Flutter',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 3,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
