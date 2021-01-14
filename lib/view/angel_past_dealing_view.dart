import 'package:angel_user_v1/controller/cat_angel_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:angel_user_v1/constants.dart';
import 'package:angel_user_v1/components.dart';

class AngelPastDealing extends StatefulWidget {

  static String id = "AngelPastDealing";
  static var image_stream;
  static int image_count=0;
//  static List<String> image_string=[];

  @override
  _AngelPastDealingState createState() => _AngelPastDealingState();
}

class _AngelPastDealingState extends State<AngelPastDealing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kbackgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: kFillerColour
        ),
        backgroundColor: kbackgroundColor,
        title: Text("Past Dealings",style: kTextStyle,),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text(
                "Past Receipt/proof",style: kLabelStyle,
              ),
               Expanded(
                flex: 3,
                  child:StreamBuilder(
                    stream: AngelListController.ImageStream,
                    builder: (context,snapshot){
                      if (!snapshot.hasData || snapshot.hasError){
                            print("i am about to generate progress");
                          return Center(
                              child: CircularProgressIndicator(
                              backgroundColor: kbackgroundColor,
                              ),
                          );
                      }
                      final List<Widget> url_image = [];
                        final images = snapshot.data;
                        try{
                          final lst = images['past_dealings'];
                          for (var lst_string in lst) {
                            final url = lst_string.toString();
                            url_image.add(
                                GestureDetector(
                                  child: GetImageWidgetViaUrl(
                                    url: url,
                                    height: 300,
                                    width: 300,
                                  ),
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context,
                                        ShowImage.id,
                                        arguments: ScreenArgument(
                                          image: Image.network(url),
                                        )
                                    );
                                  },
                                )
                            );
                          }//for loop end
                        }
                        catch(e){
                          print(e);
                        }
                      return ListView(
                        children: url_image,
                      );
                    },
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}



