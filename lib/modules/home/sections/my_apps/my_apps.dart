import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:me_landing_page/modules/home/controllers/home_controller.dart';
import 'package:me_landing_page/modules/home/controllers/home_state.dart';
import 'package:me_landing_page/modules/home/sections/my_apps/components/list_app.dart';

class MyApps extends StatefulWidget {
  const MyApps({super.key});

  @override
  State<MyApps> createState() => _MyAppsState();
}

class _MyAppsState extends State<MyApps> {
  @override
  void initState() {
    getMyApps();
    super.initState();
  }

  Future<void> getMyApps() async {
    await context.read<HomeController>().loadMyApps();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeController, HomeState>(
      listener: (context, state) {},
      builder: (context, state) => switch (state) {
        Initial() => Container(),
        Loading() => Container(),
        Success() => ListApp(myApps: state.myApps),
        _ => Container(),
      },
    );
  }
}
