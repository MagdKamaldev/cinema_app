// ignore_for_file: unused_import

import 'package:cinema_app/models/login_model.dart';
import 'package:cinema_app/models/user_model.dart';

abstract class LoginStates {}

class AppInitialState extends LoginStates {}

class AppLoginLoadingState extends LoginStates {}

class AppLoginSuccesState extends LoginStates {
  final LoginModel? loginModel;

  AppLoginSuccesState(this.loginModel);
}

class AppLoginErrorState extends LoginStates {
  final String error;
  AppLoginErrorState(this.error);
}

class AppLoginChangePasswordVisibilityState extends LoginStates {}
