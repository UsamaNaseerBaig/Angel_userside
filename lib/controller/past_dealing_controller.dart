import 'package:angel_user_v1/model/AngelPastDealing.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PastDealingController{

  static Stream<QuerySnapshot> get PastDealings => PastDealing().PastDealings;
}