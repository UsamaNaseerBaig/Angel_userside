import 'package:angel_user_v1/components.dart';
import 'package:angel_user_v1/controller/ConnectionRequestController.dart';
import 'package:angel_user_v1/controller/cat_angel_list_controller.dart';
import 'package:angel_user_v1/controller/user_info_controller.dart';
import 'package:angel_user_v1/view/angel_past_dealing_view.dart';
import 'package:angel_user_v1/view/cat_angel_list.dart';
import 'package:angel_user_v1/view/drawer_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:angel_user_v1/constants.dart';
class AngelProfileView extends StatefulWidget {
  static String id = '/AngelProfileView';
  static String cnic;
  static String angel_number = "";
  @override
  _AngelProfileViewState createState() => _AngelProfileViewState();
}

class _AngelProfileViewState extends State<AngelProfileView> {


   Map profile = {};
   String cat="";
   String workingPlace = "";
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
    var identity = profile['identity_proof'];
    setState(() {
      AngelProfileView.angel_number = identity['number'];
      AngelProfileView.cnic = identity['cnic'];
    });
  }

   void customLaunch(command)async{
     if (await  canLaunch(command)) {
       await launch(command);
     } else {
       throw 'Could not launch $command';
     }
   }

  @override
  Widget build(BuildContext context) {
    final CatArguments args = ModalRoute.of(context).settings.arguments;
        if(args.cat_index == 0) {
          cat = "Mobile, Computer Laptop";
          workingPlace = "Hafeez Center";
        }
        if(args.cat_index == 1) {
          cat = "AC,Washing Machine,LED";
          workingPlace = "Abid Market";
        }
        if(args.cat_index == 2) {
          cat = "Stitched,UnStitched etc";
          workingPlace = "Azam Market";
        }
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
                                Text(" ${cat} specialist",style: kDescStyle,),
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
                            Text("Clients Review Coming Soon",style: kDescStyle,)
                          ],
                        ),
                      )
                  ),
                  Expanded(flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RaisedButton(
                            onPressed: ()=>customLaunch("tel:${args.number}"),
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
                            onPressed: ()=>customLaunch('sms:${args.number}'),
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
                                    desc: "5 Years",
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
                                    desc: workingPlace,
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
                name: "Your Budget(Rs/-)",
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
                  Text("Estimate Charges",style: kTextStyle,),
                  Text("Rs/-${charges.toString()}",style: kTextStyle,),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("-Write Your  Approx Budget",style: kDescStyle.copyWith(color: Colors.red),),
                    Text("-Write Any Message For Angel",style: kDescStyle.copyWith(color: Colors.red),),
                    Text("-Actual Price will be evaluated after Shopping",style: kDescStyle.copyWith(color: Colors.red),),
                    Text("-Estimate Charges are Expect to change",style: kDescStyle.copyWith(color: Colors.red),)
                  ],
                ),
              ),
              ActionButton(
                name: "Send Request",
                onTap: ()async{
                  if(budget == 0 || message.isEmpty)
                  {
                    Fluttertoast.showToast(
                        msg: "UnSuccessful",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                    return;
                  }
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
                  print("send");
                  var con_obj = ConnectionRequestController();
                  bool con_status = await con_obj.AddConnection(AngelProfileView.cnic, connection_req);
                  print(con_status);
                  if (con_status)
                  {
                    Fluttertoast.showToast(
                        msg: "Request Sent Successfully.Angel will Contact You",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                    Navigator.pop(context);
                  }
                  else{
                    Fluttertoast.showToast(
                        msg: "UnSuccessful",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                  }
                },
              ),
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