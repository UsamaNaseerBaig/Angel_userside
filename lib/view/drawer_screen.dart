
import 'package:angel_user_v1/constants.dart';
import 'package:angel_user_v1/controller/login_controller.dart';
import 'package:angel_user_v1/controller/user_info_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class DrawerScreen extends StatefulWidget {
  static String currUser;
  static String currEmail;
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    var authBloc = Provider.of<LoginController>(context);
    return Scaffold(
      backgroundColor: Color(0xff1DB2B8),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: StreamBuilder<User>(
                  stream: authBloc.currentUser,
                  builder: (context, snapshot) {
                    if(!snapshot.hasData) return CircularProgressIndicator();
                    DrawerScreen.currEmail = snapshot.data.email;
                    DrawerScreen.currUser = snapshot.data.displayName;
                    if (UserInfoController.userNumber == "")
                      UserInfoController.getNumber(snapshot.data.email);
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 8,),
                        CircleAvatar(
                          backgroundImage:NetworkImage(snapshot.data.photoURL),
                          radius: 40,
                          backgroundColor: Colors.transparent,
                          ),
                        SizedBox(width: 20,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(snapshot.data.displayName,style: kTextStyle.copyWith(fontSize: 23,color: Colors.white,),),
                            SizedBox(
                              width: 20,
                            ),
                            Text(UserInfoController.userNumber,style: kTextStyle.copyWith(fontSize: 20,color: Colors.white,),)
                          ],
                        )
                      ],
                    );
                  }
                ),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RowIconButton(
                      authBloc: authBloc,
                      icon: Icon(Icons.favorite,color: Colors.white,),
                      ontap: () => print("favourites"),
                      name: "Favourites",
                    ),
                   RowIconButton(
                     authBloc: authBloc,
                     icon: Icon(Icons.shopping_bag_sharp,color: Colors.white,),
                     ontap: ()=>print("Past Dealings"),
                     name: "Past Dealings",
                   ),
                    RowIconButton(
                      authBloc: authBloc,
                      icon: Icon(Icons.settings,color: Colors.white,),
                      ontap: ()=>print("Settings"),
                      name: "Settings",
                    ),
                    RowIconButton(
                      authBloc: authBloc,
                      icon: Icon(Icons.app_blocking_outlined,color: Colors.white,),
                      ontap: ()=>print("contact"),
                      name: "Contact",
                    ),
                    RowIconButton(
                      authBloc: authBloc,
                      icon: Icon(Icons.phone,color: Colors.white,),
                      ontap: ()=>print("call"),
                      name: "Call Us",
                    )
                  ],
                ),
              ),
              Expanded(
                  child: RowIconButton(
                    authBloc: authBloc,
                    icon: Icon(Icons.logout,color: Colors.white,),
                    ontap: ()=>authBloc.logOut(),
                    name: "Log Out",
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RowIconButton extends StatelessWidget {

  final LoginController authBloc;
  final Function ontap;
  final Widget icon;
  final String name;
  RowIconButton({this.authBloc,this.ontap,this.icon,this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            icon,
            SizedBox(width: 20,),
            Text(name,style: kTextStyle.copyWith(color: Colors.white),),
          ],
        ),
      ),
    );
  }
}
