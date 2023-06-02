import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeController extends Cubit<HomeState> {
  HomeController() : super(MessageInitial());
}
