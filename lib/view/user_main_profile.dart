import 'dart:async';
import 'package:angel_user_v1/components.dart';
import 'package:angel_user_v1/constants.dart';
import 'package:angel_user_v1/controller/login_controller.dart';
import 'package:angel_user_v1/view/cat_angel_list.dart';
import 'package:angel_user_v1/view/user_login.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserMainProfile extends StatefulWidget {
  static String id= '/UserMainProfile';
  @override
  _UserMainProfileState createState() => _UserMainProfileState();
}

class _UserMainProfileState extends State<UserMainProfile> {

  //for animation
  double xoffSet = 0;
  double yoffSet = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;
  //for facebook

  StreamSubscription<User> homeStateSubscription;
  @override
  void initState() {
    var authBloc = Provider.of<LoginController>(context, listen: false);
    homeStateSubscription = authBloc.currentUser.listen((fbUser) {
      if (fbUser == null) {
        Navigator.of(context).pushReplacementNamed(UserLogin.id);
      }
    });
  }

  @override
  void dispose() {
  homeStateSubscription.cancel();
  super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var authBloc = Provider.of<LoginController>(context);
    return  GestureDetector(
      onTap: (){
        if (isDrawerOpen){
          setState(() {
            xoffSet = 0;
            yoffSet = 0;
            scaleFactor = 1;
            isDrawerOpen = false;
          });
        }
      },
      child: AnimatedContainer(
          decoration: BoxDecoration(
              color: Color(0xffEFEFEF),
              borderRadius: BorderRadius.circular(isDrawerOpen?40:0.0)
          ),
          duration: Duration(milliseconds: 250),
          transform: Matrix4.translationValues(xoffSet, yoffSet, 0)..scale(scaleFactor),
          child:  Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon : Icon(Icons.menu,size: 31,color: kFillerColour,),
                        onPressed: (){
                          setState(() {
                            xoffSet = 230;
                            yoffSet = 150;
                            scaleFactor = 0.6;
                            isDrawerOpen = true;
                          });

                        },
                      ),
                      SizedBox(width: 98,),
                      Text("angel",style: kLabelStyle.copyWith(fontSize: 31,color: kFillerColour,),),
                    ],
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: ListView.builder(
                    itemBuilder: (context,index){
                      return GestureDetector(
                        child: ShoppingTile(
                          image: shop[index].image,
                          title: shop[index].title,
                          color: shop[index].color,
                          desc: shop[index].desc,
                        ),
                        onTap: (){
                            Navigator.pushNamed(context, CatAngelList.id,arguments: CatArguments(
                              cat_index: index
                            ) );
                        },
                      );
                    },
                    itemCount: shop.length,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CurvedNavigationBar(
                    color: Colors.white,
                    backgroundColor: Colors.transparent,
                    buttonBackgroundColor: Colors.yellow.shade600,
                    height: 70,
                    items: [
                      Icon(Icons.book,size: 20,color: Color(0xff1DB2B8),),
                      Icon(Icons.phonelink_ring,size: 20,color: Color(0xff1DB2B8),),
                      Container(
                        padding: EdgeInsets.all(20),
                          child: Icon(
                            Icons.add,color: Colors.white,
                          )
                      ),
                      Icon(Icons.favorite,size: 20,color: Color(0xff1DB2B8),),
                      Icon(Icons.car_repair,size: 20,color: Color(0xff1DB2B8),),
                    ],
                    onTap: (index){
                      print(index);
                    },
                    index: 2,
                    animationDuration: Duration(days: 999999999999999),
                  ),
                ),
              ],
            ),
          ),
        );

  }
}



