import 'package:cloud_firestore/cloud_firestore.dart';

class UserInfo{
  FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Future<String>  getNumber(String email)async{
    var ref = await _firestore.collection("USER").doc(email).get();
        return ref.data()['number'];
  }
}