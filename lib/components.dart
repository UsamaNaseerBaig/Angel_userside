import 'package:angel_user_v1/view/cat_angel_list.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class ActionButton extends StatelessWidget {

  final Function onTap;
  final String name;

  ActionButton({this.onTap,this.name});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        name,
        style: kTextStyle,
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kFillerColour),
        side: MaterialStateProperty.all(
            BorderSide(width: 2, color: kTextColor)),
        padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(vertical: 10, horizontal: 50)),
        elevation: MaterialStateProperty.all(24),
      ),
    );
  }
}

//for Action Description


class ActionDescription extends StatelessWidget {
  final String desc;
  ActionDescription({this.desc});
  @override
  Widget build(BuildContext context) {
    return Text(
      desc,
      textAlign: TextAlign.center,
      style: kTextStyle,
    );
  }
}

//custom input/text field

class InputField extends StatelessWidget {

  final TextInputType type;
  final String name;
  final Function onChange;
  final bool focus;
  InputField({this.name,this.focus,this.onChange,this.type});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: TextFormField(
        keyboardType: type,
        onChanged: onChange,
        style: kTextStyle,
        autofocus: focus!=null?focus:false,
        cursorColor: kFillerColour,
        decoration: InputDecoration(
            fillColor: kFillerColour,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kFillerColour, width: 2.0),
            ),
            border: OutlineInputBorder(),
            labelText: name,
            labelStyle: kTextStyle
        ),
      ),
    );
  }
}


//....image widget
class GetImageWidget extends StatelessWidget {
  final image;
  final double width;
  final double height;
  GetImageWidget({this.image,this.width,this.height});
  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: 20,bottom: 20),
      height: height,
      width: width,
      child:image != null?Container(
        child: Image.file(image),
        decoration: BoxDecoration(
            border: Border.all(
                color: kTextColor,
                width: 3
            )
        ),
      ):Text("Add Photo"),
    );

  }
}

//request tile
class RequestTile extends StatelessWidget {

  final String title;
  final String desc;
  final Widget icon;
  final Widget end;
  final Function ontap;
  RequestTile({this.desc,this.title,this.icon,this.end,this.ontap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white
        ),
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(2),
        child: ListTile(
          contentPadding: EdgeInsets.only(top: 5,right: 5,left: 15),
          dense: true,
          onTap: ontap,
          title: Text(title,style: kTextStyle,),
          subtitle: Text(desc,style: kDescStyle,),
          leading: icon,
          trailing: end,
        ),
      ),
    );
  }
}

//image viewer
class ShowImage extends StatelessWidget {

  static String id ="extractArgument";
  @override
  Widget build(BuildContext context) {
    final ScreenArgument args = ModalRoute.of(context).settings.arguments;
    return MaterialApp(
        home: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              iconTheme: IconThemeData(
                  color: kFillerColour
              ),
              backgroundColor: Colors.black,
              title: Text("Images",style: kTextStyle.copyWith(color: Colors.white),),
            ),
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: args.image,
              ),
            ),
          ),
        )
    );
  }
}

class ScreenArgument{
  final image;
  final int index;
  ScreenArgument({this.index,this.image});
}
//
// class GeneratePin extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Color(0xff756229),
//       child: Container(
//         child: Padding(
//           padding:  EdgeInsets.all(38.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 "Generate Your Pin Code",style: kTextStyle,
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               PinCodeTextField(
//                 autoFocus: true,
//                 keyboardType: TextInputType.number,
//                 appContext: context,
//                 backgroundColor: kbackgroundColor,
//                 length: 6,
//                 obscureText: false,
//                 animationType: AnimationType.slide,
//                 pinTheme: PinTheme(
//                   shape: PinCodeFieldShape.box,
//                   borderRadius: BorderRadius.circular(5),
//                   fieldHeight: 50,
//                   fieldWidth: 40,
//                   selectedColor: kFillerColour,
//                   inactiveFillColor: kFillerColour,
//                   inactiveColor: kTextColor,
//                   activeFillColor: kFillerColour,
//                 ),
//                 animationDuration: Duration(milliseconds: 300),
//                 onCompleted: (v) {
//                   AngelIdentity.pin = v;
//                   Navigator.pop(context);
//                 },
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               ActionButton(
//                 name: "Confirm Pin Code",
//                 onTap: (){
//                   Navigator.pop(context);
//                 },
//               )
//             ],
//           ),
//         ),
//         decoration: BoxDecoration(
//             borderRadius:BorderRadius.only(topLeft: Radius.circular(31),topRight: Radius.circular(31)),
//             color: kbackgroundColor
//         ),
//       ),
//     );
//   }
// }

class AlertInfo extends StatelessWidget {
  final Widget title;
  final List<Widget> children;
  final List<Widget> action;

  AlertInfo({this.title,this.children,this.action});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: title,
        content: SingleChildScrollView(
          child: ListBody(
              children: children
          ),
        ),
        actions: action
    );
  }
}

class GetImageWidgetViaUrl extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  GetImageWidgetViaUrl({this.url,this.width,this.height});
  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: 20,bottom: 20),
      height: height,
      width: width,
      child:url != null?Container(
        child: Image.network(url),
        decoration: BoxDecoration(
            border: Border.all(
                color: kTextColor,
                width: 3
            )
        ),
      ):Text("Add Photo"),
    );

  }
}

//shopping card widget
class ShoppingTile extends StatelessWidget {

  final Image image;
  final String title;
  final String desc;
  final Color color;

  ShoppingTile({this.title,this.image,this.desc,this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.white,
      height: 190,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            flex: 1,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: EdgeInsets.only(top: 70,bottom: 30,left: 20),
                  ),
                  Align(
                    child: image,
                  )
                ],
              )
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(top: 85,bottom: 40),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  )
              ),
              child: Column(
                children: [
                  Text(title,style: kTextStyle,),
                  Text(desc,style: kDescStyle.copyWith(
                    fontSize: 15
                  ),),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//list of shopping cards
List<ShoppingTile> shop = [
  ShoppingTile(
    image: Image.asset('images/Electronics4.png'),
    title: "Electronics",
    color: Colors.blueGrey.shade300,
    desc: "Computers, Laptops, Mobile Phones etc",

  ),
  ShoppingTile(
    color: Colors.deepPurple.shade300,
    image: Image.asset('images/home.png'),
    title: "Home-Appliances",
    desc: "Refrigerators, Oven, Washing Machine etc",
  ),
  ShoppingTile(
    color: Colors.pink.shade300,
    image: Image.asset('images/clothes.png'),
    title: "Clothing",
    desc: "Stitched, un-stitched, etc ",
  ),
];

//container card for clients number ,location,experience ,images related to past
class ContainerCard extends StatelessWidget {

  final IconData icon;
  final String title;
  final String desc;

  ContainerCard({this.icon,this.desc,this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      height: 100,
      width: 170,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(icon,color: Colors.green,),
          Text(desc,style: kDescStyle,),
          Text(title,style: kTextStyle.copyWith(
              color: Colors.black,
              fontSize: 17
          ),)
        ],
      ),
    );
  }
}
