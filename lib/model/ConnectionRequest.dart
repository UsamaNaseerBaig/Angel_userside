import 'package:angel_user_v1/controller/ConnectionRequestController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ConnectionRequest{
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  
  void AddConnection(String cnic,Map conn)async{
     await _firestore.collection("Connection")
         .add(conn)
         .then((value) => ConnectionRequestController.req_status = true)
         .catchError(() => print("failed"));
  }
}