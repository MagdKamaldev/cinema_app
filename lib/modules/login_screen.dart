// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unused_local_variable, must_be_immutable

import 'package:cinema_app/modules/register_screen.dart';
import 'package:cinema_app/shared/components.dart';
import 'package:cinema_app/shared/cubit/login_cubit/login_cubit.dart';
import 'package:cinema_app/shared/cubit/login_cubit/login_states.dart';
import 'package:cinema_app/shared/styles/colors.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 200,
                        width: 200,
                        child: Image.asset(
                          "assets/images/Asset 1.png",
                        ),
                      ),
                      Divider(
                        color: defaultColor,
                        thickness: 3,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Welcome",
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: defaultColor, fontSize: 30),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "The faster you fill up , the faster you get a ticket",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      defaultFormField(
                          validate: (String value) {
                            if (value.isEmpty) {
                              return "Please enter your email adress";
                            }
                          },
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          onSubmit: () {},
                          onTab: () {},
                          onChanged: () {},
                          label: "E-mail Adress",
                          prefix: Icons.email_outlined),
                      SizedBox(
                        height: 25.0,
                      ),
                      defaultFormField(
                          validate: (String value) {
                            if (value.isEmpty) {
                              return "Password is too short";
                            }
                          },
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          onSubmit: () {},
                          onTab: () {},
                          onChanged: () {},
                          label: "Password",
                          prefix: Icons.lock_outline,
                          suffix: Icons.visibility_outlined,
                          suffixPressed: () {}),
                      SizedBox(
                        height: 25,
                      ),
                      ConditionalBuilder(
                        condition: state is! AppLoginLoadingState,
                        builder: (context) => defaultButton(
                            function: () {
                              if(formKey.currentState!.validate()){
                                 LoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text);
                              }
                             
                            },
                            text: "Login",
                            isUpperCase: true),
                        fallback: (context) => CircularProgressIndicator(),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account ?"),
                          defaultTextButton(
                              text: "Register",
                              onpressed: () {
                                navigateTo(context, RegisterScreen());
                              }),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
