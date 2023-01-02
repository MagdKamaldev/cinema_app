// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:cinema_app/models/home_model.dart';
import 'package:cinema_app/modules/inside_user/favourites_screen.dart';
import 'package:cinema_app/modules/inside_user/profile_screen.dart';
import 'package:cinema_app/modules/inside_user/search_screen.dart';
import 'package:cinema_app/shared/cubit/app_cubit/app_states.dart';
import 'package:cinema_app/shared/networks/remote/dio_helper.dart';
import 'package:cinema_app/shared/networks/remote/end_points.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../modules/inside_user/home_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppinitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> bootomScreens = [
    HomeScreen(),
    SearchScreen(),
    ActorsScreen(),
    SettingsScreen(),
  ];
  void changeBottomNav(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavState());
  }

  HomeModel? homeModel;
  void getHomeData() {
    emit(AppGetMoviesDataLoadingState());
    DioHelper.getData(
      url: getMovies,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      emit(AppGetMoviesDataSuccesState());
    }).catchError((error) {
      print(error.toString());
      emit(AppGetMoviesDataErrorState());
    });
  }

  bool isRated = false;
  void saveRating(double rate, String id) {
    isRated = !isRated;
    emit(AppSubmitRateState());
    DioHelper.postData(url: rateMovie, data: {
      "id": id,
      "rating": rate,
    });
  }
}
