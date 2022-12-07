// ignore_for_file: prefer_const_constructors, deprecated_member_use
import 'package:cinema_app/modules/on_boarding_screen.dart';
import 'package:cinema_app/shared/bloc_observer.dart';
import 'package:cinema_app/shared/cubit/login_cubit/login_cubit.dart';
import 'package:cinema_app/shared/cubit/login_cubit/login_states.dart';
import 'package:cinema_app/shared/networks/local/cache_helper.dart';
import 'package:cinema_app/shared/networks/remote/dio_helper.dart';
import 'package:cinema_app/shared/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (BuildContext context) => LoginCubit())],
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            title: 'Cinema Guide',
            theme: lightTheme,
            darkTheme: darkTheme,
            home: OnBoardingScreen(),
            themeMode: ThemeMode.light,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
