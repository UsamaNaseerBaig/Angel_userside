import 'package:angel_user_v1/components.dart';
import 'package:angel_user_v1/controller/login_controller.dart';
import 'package:angel_user_v1/view/angel_past_dealing_view.dart';
import 'package:angel_user_v1/view/angel_profile_view.dart';
import 'package:angel_user_v1/view/cat_angel_list.dart';
import 'package:angel_user_v1/view/stack.dart';
import 'package:angel_user_v1/view/user_login.dart';
import 'package:angel_user_v1/view/user_main_profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());

}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => LoginController(),
      child: MaterialApp(
        initialRoute: UserLogin.id,
        routes: {
          UserLogin.id : (context) => UserLogin(),
          UserMainProfile.id : (context) => UserMainProfile(),
          StackScreen.id : (context) => StackScreen(),
          CatAngelList.id : (context) => CatAngelList(),
          AngelProfileView.id : (context) => AngelProfileView(),
          AngelPastDealing.id : (context) => AngelPastDealing(),
          ShowImage.id :(BuildContext context) => ShowImage(),
        },
      ),
    );
  }
}

