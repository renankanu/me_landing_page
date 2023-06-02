import 'package:me_landing_page/model/my_app.dart';

sealed class HomeState {}

class Initial extends HomeState {}

class Loading extends HomeState {}

class Success extends HomeState {
  Success(this.myApps);
  final List<MyApp> myApps;
}

class Error extends HomeState {
  Error(this.message);
  final String message;
}
