import 'dart:async';

import 'package:angel_user_v1/components.dart';
import 'package:angel_user_v1/controller/login_controller.dart';
import 'package:angel_user_v1/view/stack.dart';
import 'package:angel_user_v1/view/user_main_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:provider/provider.dart';
class UserLogin extends StatefulWidget {
  static String id= '/UserLogin';
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {

  StreamSubscription<User> logInStateSubscription;
  @override
  void initState() {
    var authBloc = Provider.of<LoginController>(context,listen: false);
    logInStateSubscription = authBloc.currentUser.listen((fbUser) {
      if (fbUser != null){

        Navigator.of(context).pushReplacementNamed(StackScreen.id);
      }
    });
  }

  @override
  void dispose() {
  logInStateSubscription.cancel();
  super.dispose();
  }

  String number;
  @override
  Widget build(BuildContext context) {
    var authBloc = Provider.of<LoginController>(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InputField(
                type: TextInputType.number,
                name: "Your number like 03004848253",
                onChange: (v){
                  setState(() {
                    number = v;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              SignInButton(
                  Buttons.Facebook,
                onPressed: (){
                    if (number.length == 11){
                      authBloc.logInFacebook(number);
                    }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
