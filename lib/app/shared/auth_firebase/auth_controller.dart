import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'auth_firebase_interface.dart';
part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final IAuthFirebase _authFirebase = Modular.get();

  @observable
  AuthStatus status = AuthStatus.loading;

  @observable
  FirebaseUser user;

  @action
  setUser(FirebaseUser value) {
    user = value;
    status = user == null ? AuthStatus.logoff : AuthStatus.login;
  }

  _AuthControllerBase() {
    _authFirebase.getUser().then(setUser).catchError((e) {
      print('ERRORRRRRR');
    });
  }

  @action
  Future loginWithGoogle() async {
    try {
      user = await _authFirebase.getGoogleLogin();
    } catch (e) {
      throw e;
    }
  }

  @action
  Future loginWithEmailPassword({String email, String password}) async {
    try {
      user = await _authFirebase.getEmailPasswordLogin(
          email: email, password: password);
    } catch (e) {
      throw e;
    }
  }

  @action
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
