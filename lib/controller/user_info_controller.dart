import 'package:angel_user_v1/model/UserInfo.dart';

class UserInfoController{
  static String  userNumber="";

  static void getNumber(String email)async{
    var user = UserInfo();
    userNumber = await user.getNumber(email);
  }

}