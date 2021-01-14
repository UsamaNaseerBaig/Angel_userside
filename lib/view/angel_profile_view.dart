import 'package:angel_user_v1/components.dart';
import 'package:angel_user_v1/controller/ConnectionRequestController.dart';
import 'package:angel_user_v1/controller/cat_angel_list_controller.dart';
import 'package:angel_user_v1/controller/login_controller.dart';
import 'package:angel_user_v1/controller/user_info_controller.dart';
import 'package:angel_user_v1/view/angel_past_dealing_view.dart';
import 'package:angel_user_v1/view/cat_angel_list.dart';
import 'package:angel_user_v1/view/drawer_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:angel_user_v1/constants.dart';
class AngelProfileView extends StatefulWidget {
  static String id = '/AngelProfileView';
  static String cnic;
  @override
  _AngelProfileViewState createState() => _AngelProfileViewState();
}

class _AngelProfileViewState extends State<AngelProfileView> {


   Map profile = {};

  @override
  void initState() {
    getCurrentAngel();
  }

  //getting data of a selected angel
  Future<void> getCurrentAngel()async{
    String args = CatAngelList.number;
    var angel_obj = AngelListController();
    print(args);
    await angel_obj.GetAngel(args);
    profile = angel_obj.angel_profile;
    var personal = profile['personal_details'];
    var identity = profile['identity_proof'];
    setState(() {
      AngelProfileView.cnic = identity['cnic'];
    });

  }

  @override
  Widget build(BuildContext context) {
    final CatArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffFAFAFD),
      body: SafeArea(
        child:  Column(//tab bar for Angel Main profile
          children: [
            Expanded(//for header
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                          icon : Icon(Icons.arrow_back_ios_rounded),
                          onPressed: () => Navigator.pop(context),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Column(
                        children: [
                          Text("Angel's Profile",style: kTextStyle),
                          Text("Service Time 10:00am - 10:00pm",style: TextStyle(color: Colors.green),),
                        ],
                      )
                    ],
                  ),
                )
            ),
            Expanded(flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Mr. ${args.name}",style: kTextStyle,),
                          Text("Mobile, Computer, Laptop specialist",style: kDescStyle,),
                        ],
                      ),
                      CircleAvatar()
                    ],
                  ),
                )
            ),
            Expanded(flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.star,color: Color(0xffFECD7A),),
                          Icon(Icons.star,color: Color(0xffFECD7A)),
                          Icon(Icons.star,color: Color(0xffFECD7A)),
                          Icon(Icons.star,color: Color(0xffFECD7A)),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("70 Clients Review",style: kDescStyle,)
                    ],
                  ),
                )
            ),
            Expanded(flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      onPressed: ()=>print("call"),
                      padding: EdgeInsets.all(12),
                      color: Colors.green.shade100,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)),
                      child: Container(
                        child: Icon(Icons.call,color: Colors.green,),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    RaisedButton(
                      onPressed: ()=>print("message"),
                      padding: EdgeInsets.all(12),
                      color: Colors.deepPurple.shade100,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)),
                      child: Container(
                        child: Icon(Icons.message,color: Colors.deepPurple,),
                      ),
                    ),
                  ],
                )
            ),
            Expanded(
              flex: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25,),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ContainerCard(
                              title: "Successful Clients",
                              desc: "10+",
                              icon: Icons.shop,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ContainerCard(
                              title: "Experience",
                              desc: "10 Years",
                              icon: Icons.timer,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              child: ContainerCard(
                                title: "Past Dealings",
                                desc: "images",
                                icon: Icons.account_circle,
                              ),
                              onTap: (){
                                Navigator.pushNamed(context,AngelPastDealing.id);
                              },
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ContainerCard(
                              title: "Location",
                              desc: "Hafeez Center",
                              icon: Icons.location_on,
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                )
            ),
            Expanded(
                child: ActionButton(
                  name: "Request For Service",
                  onTap: () {
                    showModalBottomSheet<void>(context: context,isScrollControlled: true,builder: (BuildContext context){
                      return CreatePostForAngel(
                          index :args.cat_index);
                    });
                  }
                ),
            ),

          ],
        ),
    )
    );
  }
}

class CreatePostForAngel extends StatefulWidget {
  final int index;

  CreatePostForAngel({this.index});

  @override
  _CreatePostForAngelState createState() => _CreatePostForAngelState();
}

class _CreatePostForAngelState extends State<CreatePostForAngel> {
  int charges = 0;

  int budget = 0;

  String message = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade600,
      child: Container(
        child: Padding(
          padding:  EdgeInsets.all(38.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Create Post",style: kTextStyle,
              ),
              SizedBox(
                height: 20,
              ),
              InputField(
                type: TextInputType.number,
                name: "Minimum Budget(Rs/-)",
                onChange: (v){
                  setState(() {
                    budget = int.parse(v);
                    charges = budget~/100;
                  });
                  },
              ),
              SizedBox(
                height: 20,
              ),
              InputField(
                type: TextInputType.name,
                name: "Message For Angel",
                onChange: (v){
                  setState(() {
                    message = v.toString();
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Minimum Charges",style: kTextStyle,),
                  Text("Rs/-${charges.toString()}",style: kTextStyle,),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ActionButton(
                name: "Send Request",
                onTap: (){
                  String cat='';
                  print(widget.index);
                  if(widget.index == 0) cat = "Electronics";
                  if(widget.index == 1) cat = "Home-Appliances";
                  if(widget.index == 2) cat = "Clothing";
                  Map<String,dynamic> connection_req={
                    "category" : cat,
                    "budget" : budget.toString(),
                    "charges" : charges.toString(),
                    "from" : DrawerScreen.currUser.toString(),
                    "to" : AngelProfileView.cnic,
                    "message" : message,
                    "number" : UserInfoController.userNumber,
                    "time" : DateTime.now(),
                  };
                  ConnectionRequestController.AddConnection(AngelProfileView.cnic, connection_req);
                  ConnectionRequestController.req_status ? Navigator.pop(context):null;
                  },
              )
            ],
          ),
        ),
        decoration: BoxDecoration(
            borderRadius:BorderRadius.only(topLeft: Radius.circular(31),topRight: Radius.circular(31)),
            color: Colors.white
        ),
      ),
    );
  }
}