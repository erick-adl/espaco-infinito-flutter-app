import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/state_manager.dart';

import 'auth_firebase_interface.dart';

class AuthController extends GetxController {
  final IAuthFirebase _authFirebase = Modular.get();

  final status = AuthStatus.loading.obs;

  FirebaseUser user;

  setUser(FirebaseUser value) {
    user = value;
    status.value = user == null ? AuthStatus.logoff : AuthStatus.login;
  }

  AuthController() {
    _authFirebase.getUser().then(setUser).catchError((e) {
      print('#######   #######  ERRORRRRRR  #######   #######');
    });
  }

  Future loginWithGoogle() async {
    try {
      user = await _authFirebase.getGoogleLogin();
    } catch (e) {
      throw e;
    }
  }

  Future loginWithEmailPassword({String email, String password}) async {
    try {
      user = await _authFirebase.getEmailPasswordLogin(
          email: email, password: password);
    } catch (e) {
      throw e;
    }
  }

  Future createUserWithEmailAndPassword(
      {String name, String email, String password}) async {
    try {
      user = await _authFirebase.createUserWithEmailPassword(
          name: name, email: email, password: password);
    } catch (e) {
      throw e;
    }
  }

  void logout() {
    _authFirebase.getLogout();
    Modular.to.pushReplacementNamed('/login');
  }
}

enum AuthStatus { loading, login, logoff }
