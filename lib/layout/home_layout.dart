// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors
import 'package:flutter/material.dart';

import '../main.dart';

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Center(child: Text("Username: ${currentUser!.iD}")),
    );
  }
}
