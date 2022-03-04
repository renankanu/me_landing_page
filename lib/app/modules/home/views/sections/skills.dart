import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Skills extends StatelessWidget {
  const Skills({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      constraints: BoxConstraints(minHeight: Get.height),
      child: const Text('Skills'),
    );
  }
}
