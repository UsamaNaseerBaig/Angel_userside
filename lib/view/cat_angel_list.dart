import 'package:angel_user_v1/components.dart';
import 'package:angel_user_v1/controller/cat_angel_list_controller.dart';
import 'package:angel_user_v1/view/angel_profile_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class CatAngelList extends StatefulWidget {
  static String id = '/CatAngelList';
  static String number;

  @override
  _CatAngelListState createState() => _CatAngelListState();
}

class _CatAngelListState extends State<CatAngelList> {
  @override
  Widget build(BuildContext context) {
    final CatArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color(0xffEFEFEF),
      body: SafeArea(
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream:  AngelListController.Angel_list,
                builder: (context,snapshot){
                if(!snapshot.hasData || snapshot.hasError) return Center(child: CircularProgressIndicator());
                List<RequestTile> req_tile = [];
                try {
                  final detail = snapshot.data.docs;
                  for (var snap in detail) {
                    if (args.cat_index == 0) {
                      if (snap['personal_details.category'].toString() ==
                          'Electronics') {
                        var new_tile = RequestTile(
                          title: snap['personal_details.full_name'],
                          desc: snap['identity_proof.number'],
                          icon: CircleAvatar(),
                          end: Icon(Icons.navigate_next, color: Colors.black,),
                        );
                        req_tile.add(new_tile);
                      }
                    }
                    else if (args.cat_index == 1) {
                      if (snap['personal_details.category'].toString() ==
                          'Home-Appliances') {
                        var new_tile = RequestTile(
                          title: snap['personal_details.full_name'],
                          desc: snap['identity_proof.number'],
                          icon: CircleAvatar(foregroundColor: Colors.green,),
                          end: Icon(Icons.navigate_next, color: Colors.green,),
                        );
                        req_tile.add(new_tile);
                      }
                    }
                    else if (args.cat_index == 2) {
                      if (snap['personal_details.category'].toString() ==
                          'Clothing') {
                        var new_tile = RequestTile(
                          title: snap['personal_details.full_name'],
                          desc: snap['identity_proof.number'],
                          icon: CircleAvatar(foregroundColor: Colors.pink,),
                          end: Icon(Icons.navigate_next, color: Colors.pink,),
                        );
                        req_tile.add(new_tile);
                      }
                    }
                  }
                }
                catch(e){
                  print(e);
                }
                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (context,index){
                      return GestureDetector(
                        onTap: (){
                          CatAngelList.number = req_tile[index].desc;
                          Navigator.pushNamed(context,AngelProfileView.id,
                          arguments: CatArguments(
                            number: req_tile[index].desc,
                            name: req_tile[index].title,
                            cat_index: args.cat_index,
                          )
                          );
                        },
                        child: RequestTile(
                          title: req_tile[index].title,
                          desc: req_tile[index].desc,
                          icon: req_tile[index].icon,
                          end: Icon(Icons.navigate_next,color: Colors.black,),
                        ),
                      );
                    },
                    itemCount: req_tile.length,
                  ),
                );
                }
            )
          ],
        ),
      ),
    );
  }
}


class CatArguments{
  int cat_index;
  String number;
  String name;
  CatArguments({this.cat_index,this.number,this.name});
}