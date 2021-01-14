import 'package:angel_user_v1/model/AngelList.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AngelListController{

  Map angel_profile = {};
  static Stream<QuerySnapshot> get Angel_list  => AngelList().Angel_List;
  static Stream<DocumentSnapshot> get ImageStream  => AngelList().ImageStream;

  void GetAngel(String num)async{
     var profile = AngelList();
     angel_profile =await profile.GetProfile(num);
     print(angel_profile);
   }

}