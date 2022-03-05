import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../data/model/skill.dart';

class HomeController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final RxList<Skill> _skills = RxList<Skill>();

  List<Skill> get skills => _skills.toList();

  @override
  void onInit() {
    getAllSkills();
    super.onInit();
  }

  Future<void> getAllSkills() async {
    final querySnapshot = await _firestore.collection('skill').get();
    for (final doc in querySnapshot.docs) {
      _skills.add(Skill.fromJson(doc.data()));
    }
  }
}
