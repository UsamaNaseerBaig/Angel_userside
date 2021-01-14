import 'package:angel_user_v1/model/login.dart';
import 'package:angel_user_v1/view/drawer_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
class LoginController{
  // final authService = ;
  final fb = FacebookLogin();

  Stream<User> get currentUser => Login().currentUser;


  Future<void> logOut() => Login().logOut();


  logInFacebook(String num)async{
    final  res = await fb.logIn(
      permissions: [
        FacebookPermission.publicProfile,
        FacebookPermission.email,
      ],
    );
    switch(res.status){
      case FacebookLoginStatus.success:
        //it worked
        final FacebookAccessToken fbToken = res.accessToken;

        //convert for auth credential for firebase
        final AuthCredential credential = FacebookAuthProvider.credential(fbToken.token);

        //sending credential to firebase
        final result = await Login().signInWithCredential(credential);
        print("${result.user.email} ${num}");
        final user_doc = await Login().AddDocument(result.user.email, num);
        print("${result.user.displayName} is now logged in");
        break;
      case FacebookLoginStatus.cancel:
        print("operation cancelled");
        break;
      case FacebookLoginStatus.error:
        print('error occured');
        break;

    }
  }
}