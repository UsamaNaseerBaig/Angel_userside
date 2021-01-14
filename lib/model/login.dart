import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login{
  final _auth = FirebaseAuth.instance;
  Stream<User> get currentUser => _auth.authStateChanges();
  Future<UserCredential> signInWithCredential(AuthCredential credential) => _auth.signInWithCredential(credential);
  Future<void> logOut() => _auth.signOut();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;  

  Future<bool> DocExist(String email)async{
    var doc = await _firestore.collection("USER").doc(email).get();
     return  doc.exists ? true : false ;
  }
  Future<bool> AddDocument(String email,String num) async {
    bool status = false;
    bool doc_status = await DocExist(email); //checking if number exist on email return true if exists
    if (doc_status)
      return doc_status;
   await _firestore.collection("USER")
       .doc(email)
       .set({'number' : num})
       .then((value) =>  status = true)
       .catchError(()=>print("cant update"));
    return status;
  }

}