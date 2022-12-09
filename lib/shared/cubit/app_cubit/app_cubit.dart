import 'package:cinema_app/modules/inside_user/favourites_screen.dart';
import 'package:cinema_app/modules/inside_user/profile_screen.dart';
import 'package:cinema_app/modules/inside_user/search_screen.dart';
import 'package:cinema_app/shared/cubit/app_cubit/app_states.dart';
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
    FavouritesScreen(),
    ProfileScreen(),
  ];
  void changeBottomNav(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavState());
  }
}
