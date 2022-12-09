// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables
import 'package:cinema_app/models/login_model.dart';
import 'package:cinema_app/shared/cubit/login_cubit/login_states.dart';
import 'package:cinema_app/shared/networks/remote/dio_helper.dart';
import 'package:cinema_app/shared/networks/remote/end_points.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(AppInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);
  var token;
  LoginModel? loginModel;
  Future<void> userLogin({
    required String email,
    required String password,
  }) async {
    
    
    emit(AppLoginLoadingState());

    DioHelper.postData(url: login, data: {
      "email": email,
      "password": password,
    }).then((value) async {
      loginModel = LoginModel.fromJson(value.data);
        // jwt = value.data["jwt"];
        // await CacheHelper.storeString(key: "jwt", value: jwt!);
        // await DioHelper.jwtOrEmpty();
        emit(AppLoginSuccesState(loginModel));
    }).catchError((error) {
      emit(AppLoginErrorState(error.toString()));
      print(error.toString());
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void changePasswordVisibility() {
    suffix =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    isPassword = !isPassword;
    emit(AppLoginChangePasswordVisibilityState());
  }
}
