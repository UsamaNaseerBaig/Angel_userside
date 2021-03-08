import 'package:angel_user_v1/view/angel_profile_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PastDealing {
  final _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> get PastDealings =>
      _firestore.collection("Dealing").where(
          "number", isEqualTo: AngelProfileView.angel_number).orderBy(
          "time", descending: true).snapshots();
}