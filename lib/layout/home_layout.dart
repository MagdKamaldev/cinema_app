// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors
import 'package:cinema_app/modules/login_screen.dart';
import 'package:cinema_app/shared/components.dart';
import 'package:cinema_app/shared/networks/local/cache_helper.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: defaultTextButton(
              text: "signOut",
              onpressed: () {
                CacheHelper.removeData(key: "token").then((value) {
                  if (value) {
                    navigateAndFinish(context, LoginScreen());
                  }
                });
              })),
    );
  }
}
