import 'package:angel_user_v1/controller/ConnectionRequestController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ConnectionRequest{
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  
  Future<bool> AddConnection(String cnic,Map conn)async{
     bool connection_status = false;
     await _firestore.collection("Connection")
         .add(conn)
         .then((value) => connection_status = true)
         .catchError((Object Error) => print(Error));
     print("returning adding connection");
     return connection_status;

  }
}