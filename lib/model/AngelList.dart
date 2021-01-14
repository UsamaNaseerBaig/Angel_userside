import 'package:angel_user_v1/view/angel_past_dealing_view.dart';
import 'package:angel_user_v1/view/angel_profile_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AngelList{
  FirebaseFirestore ref = FirebaseFirestore.instance;
  Stream<QuerySnapshot> get Angel_List  =>  ref.collection("ANGEL").snapshots();
  Stream<DocumentSnapshot> get ImageStream => AngelPastDealing.image_stream = ref.collection("ANGEL").doc(AngelProfileView.cnic).snapshots();


  Future<Map> GetProfile(String num)async{
    print("about");
    var doc = await ref.collection("ANGEL").where('identity_proof.number',isEqualTo: num).get();
    for (var pro in doc.docs){
      return pro.data();
    }
  }
}