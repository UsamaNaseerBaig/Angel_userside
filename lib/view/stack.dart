import 'package:angel_user_v1/constants.dart';
import 'package:angel_user_v1/view/drawer_screen.dart';
import 'package:angel_user_v1/view/user_main_profile.dart';
import 'package:flutter/material.dart';

class StackScreen extends StatefulWidget {
  static String id = '/StackScreen';

  @override
  _StackScreenState createState() => _StackScreenState();
}

class _StackScreenState extends State<StackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kFillerColour,
      body: Stack(
        children: <Widget>[
          DrawerScreen(),
          UserMainProfile(),
        ],
        ),
    );
  }
}
