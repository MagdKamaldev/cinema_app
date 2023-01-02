// ignore_for_file: prefer_const_constructors, deprecated_member_use, avoid_print, prefer_typing_uninitialized_variables, unused_local_variable, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, unnecessary_null_comparison
import 'package:cinema_app/modules/app_start_point/login_screen.dart';
import 'package:cinema_app/modules/app_start_point/on_boarding_screen.dart';
import 'package:cinema_app/shared/bloc_observer.dart';
import 'package:cinema_app/shared/cubit/app_cubit/app_cubit.dart';
import 'package:cinema_app/shared/cubit/login_cubit/login_cubit.dart';
import 'package:cinema_app/shared/cubit/login_cubit/login_states.dart';
import 'package:cinema_app/shared/networks/local/cache_helper.dart';
import 'package:cinema_app/shared/networks/remote/dio_helper.dart';
import 'package:cinema_app/shared/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'layout/home_layout.dart';

dynamic token = "";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  //jwt = CacheHelper.getString(key: "jwt");
  DioHelper.init();
  Widget? widget;
  bool? onBoarding = CacheHelper.getData(key: "onBoarding");
  token = CacheHelper.getData(key: "token");
  if (onBoarding != null) {
    if (token != null) {
      widget = HomeLayout();
    } else {
      widget = LoginScreen();
    }
  } else {
    widget = OnBoardingScreen();
  }
  runApp(MyApp(widget));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  MyApp(this.startWidget);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => LoginCubit()),
        BlocProvider(
            create: (BuildContext context) => AppCubit()..getHomeData()),
      ],
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            title: 'Cinema Guide',
            theme: lightTheme,
            darkTheme: darkTheme,
            home: startWidget,
            themeMode: ThemeMode.light,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
