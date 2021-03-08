import 'package:angel_user_v1/model/ConnectionRequest.dart';

class ConnectionRequestController{

   Future<bool> AddConnection(String cnic,Map con)async{
     var con_obj = ConnectionRequest();
    bool status = await con_obj.AddConnection(cnic, con);
    print("in controller");
    return status;
  }
}