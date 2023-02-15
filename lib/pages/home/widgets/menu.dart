import 'dart:ui';

import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 10.0,
          sigmaY: 10.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.grey.withAlpha(20),
                Colors.grey.withAlpha(20),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: const EdgeInsets.all(24),
          child: Row(
            children: [
              TextButton(
                onPressed: () {},
                child: const Text('Home'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('About'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Contact'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
