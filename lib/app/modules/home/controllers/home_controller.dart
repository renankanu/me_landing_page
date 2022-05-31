import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../data/model/skill.dart';

class HomeController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final RxList<Skill> _skills = RxList<Skill>();
  final RxInt _selectedIndex = RxInt(0);
  final RxBool _isShowArrow = RxBool(true);

  List<Skill> get skills => _skills.toList();
  int get selectedIndex => _selectedIndex.value;
  bool get isShowArrow => _isShowArrow.value;

  set selectedIndex(int value) => _selectedIndex.value = value;
  set isShowArrow(bool value) => _isShowArrow.value = value;

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
