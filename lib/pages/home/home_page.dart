import 'package:flutter/material.dart';
import 'package:me_landing_page/pages/home/widgets/menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          Menu(),
        ],
      ),
    );
  }
}
