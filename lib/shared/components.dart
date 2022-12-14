// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace
import 'package:cinema_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../modules/app_start_point/login_screen.dart';
import 'networks/local/cache_helper.dart';

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );


Widget defaultTextButton({
  required String text,
  required VoidCallback onpressed,
}) =>
    TextButton(onPressed: onpressed, child: Text(text.toUpperCase()));

Widget defaultButton({
  double width = double.infinity,
  Color background = defaultColor,
  bool isUpperCase = true,
  double radius = 0.0,
  required VoidCallback function,
  required String text,
}) =>
    Container(
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: background,
        ),
        child: MaterialButton(
          onPressed: function,
          child: Text(
            isUpperCase ? text.toUpperCase() : text,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ));

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required Function onSubmit,
  required Function onTab,
  required Function onChanged,
  Function? validate,
  bool isPassword = false,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function? suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      validator: (value) {
        return validate!(value);
      },
      controller: controller,
      keyboardType: type,
      enabled: isClickable,
      obscureText: isPassword,
      onFieldSubmitted: (s) {
        onSubmit();
      },
      onChanged: (s) => onChanged,
      onTap: () => onTab(),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                icon: Icon(
                  suffix,
                ),
                onPressed: () {
                  suffixPressed!();
                },
              )
            : null,
        border: OutlineInputBorder(),
      ),
    );

void navigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (context) => widget), (route) {
      return false;
    });
void showToast({
  required String text,
  required ToasStates state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      fontSize: 16,
    );

enum ToasStates { succes, error, warning }

Color chooseToastColor(ToasStates state) {
  Color color;
  switch (state) {
    case ToasStates.succes:
      color = Colors.green;
      break;
    case ToasStates.error:
      color = Colors.red;
      break;
    case ToasStates.warning:
      return Colors.amber;
  }
  return color;
}
void signOut(context){
    CacheHelper.removeData(key: "token").then((value) {
                      if (value) {
                        navigateAndFinish(context, LoginScreen());
                      }
                    });
}
