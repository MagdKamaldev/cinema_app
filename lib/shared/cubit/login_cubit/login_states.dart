abstract class LoginStates {}

class AppInitialState extends LoginStates {}

class AppLoginLoadingState extends LoginStates {}

class AppLoginSuccesState extends LoginStates {}

class AppLoginErrorState extends LoginStates {
  final String error;
  AppLoginErrorState(this.error);
}
