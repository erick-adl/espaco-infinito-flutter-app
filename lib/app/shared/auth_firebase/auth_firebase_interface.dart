import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthFirebase {
  Future<FirebaseUser> getUser();
  Future<FirebaseUser> getGoogleLogin();
  Future getFacebookLogin();
  Future<FirebaseUser> getEmailPasswordLogin({String email, String password});
  Future<FirebaseUser> createUserWithEmailPassword(
      {String name, String email, String password});
  Future<String> getToken();
  Future getLogout();
}
