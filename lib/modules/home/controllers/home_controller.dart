import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:me_landing_page/model/my_app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'home_state.dart';

class HomeController extends Cubit<HomeState> {
  HomeController() : super(Initial());

  final supabase = Supabase.instance.client;

  Future<void> loadMyApps() async {
    emit(Loading());
    try {
      final allMyApps = <MyApp>[];
      final data = await supabase.from('my_apps').select();
      final list = data as List;
      for (final item in list) {
        allMyApps.add(MyApp.fromMap(item as Map<String, dynamic>));
      }
      emit(Success(allMyApps));
    } catch (e) {
      log(e.toString());
      emit(Error(e.toString()));
    }
  }
}
