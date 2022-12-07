// ignore_for_file: avoid_print
import 'package:cinema_app/shared/cubit/login_cubit/login_states.dart';
import 'package:cinema_app/shared/networks/remote/dio_helper.dart';
import 'package:cinema_app/shared/networks/remote/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(AppInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);
  void userLogin({
    required String email,
    required String password,
  }) {
    emit(AppLoginLoadingState());
    DioHelper.postData(url: login, data: {
      "email": email,
      "password": password,
    }).then((value) {
      print(value.data);
      emit(AppLoginSuccesState());
    }).catchError((error) {
      emit(AppLoginErrorState(error.toString()));
    });
  }
}
