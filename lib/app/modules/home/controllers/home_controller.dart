import 'package:amplitude_flutter/amplitude.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../data/model/skill.dart';

class HomeController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final RxList<Skill> _skills = RxList<Skill>();
  final RxInt _selectedIndex = RxInt(0);

  List<Skill> get skills => _skills.toList();
  int get selectedIndex => _selectedIndex.value;

  set selectedIndex(int value) => _selectedIndex.value = value;

  @override
  Future<void> onInit() async {
    await getAllSkills();
    await initAmplitude();
    super.onInit();
  }

  Future<void> getAllSkills() async {
    final querySnapshot = await _firestore.collection('skill').get();
    for (final doc in querySnapshot.docs) {
      _skills.add(Skill.fromJson(doc.data()));
    }
  }

  Future<void> initAmplitude() async {
    final Amplitude analytics = Amplitude.getInstance(instanceName: 'project');

    analytics.init('b2aa03906e56cf33c6668d7d4208f6d6');
    analytics.setUserId('test_user');
    analytics.trackingSessionEvents(true);

    analytics.logEvent(
      'RenanKanu;',
      eventProperties: {'friend_num': 10, 'is_heavy_user': true},
    );
  }
}
