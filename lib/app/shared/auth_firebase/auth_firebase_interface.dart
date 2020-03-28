import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthFirebase {
  Future<FirebaseUser> getUser();
  Future<FirebaseUser> getGoogleLogin();
  Future getFacebookLogin();
  Future getEmailPasswordLogin();
  Future<String> getToken();
  Future getLogout();
}
