import 'package:angel_user_v1/model/ConnectionRequest.dart';

class ConnectionRequestController{

  static bool req_status = false;

  static void AddConnection(String cnic,Map con){
    ConnectionRequest().AddConnection(cnic, con);
  }
}