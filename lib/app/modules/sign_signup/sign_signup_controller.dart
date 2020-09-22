import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinito/app/shared/auth_firebase/auth_controller.dart';
import 'package:mobx/mobx.dart';

part 'sign_signup_controller.g.dart';

class SignSignupController = _SignSignupControllerBase
    with _$SignSignupController;

abstract class _SignSignupControllerBase with Store {
  AuthController _authController = Modular.get();

  //all
  @observable
  bool loading = false;
  @observable
  String errorMessage = "";

  @action
  changeErrorMessage(String value) => errorMessage = value;

  //signUp
  @observable
  String signupName = "";
  @observable
  String signupEmail = "";
  @observable
  String signupPassword = "";
  @observable
  String signupPasswordCheck = "";
  @action
  signupChangeName(String value) => signupName = value;
  @action
  signupChangeEmail(String value) => signupEmail = value;
  @action
  signupChangePassword(String value) => signupPassword = value;
  @action
  signupChangePasswordCheck(String value) => signupPasswordCheck = value;

  //login
  @observable
  String loginEmail = "";
  @observable
  String loginPassword = "";

  @action
  loginChangeEmail(String value) => loginEmail = value;
  @action
  loginChangePassword(String value) => loginPassword = value;

  void _clean() {
    signupName = "";
    signupEmail = "";
    signupPassword = "";
    signupPasswordCheck = "";
    loginEmail = "";
    loginPassword = "";
  }

  @action
  Future register() async {
    try {
      loading = true;
      await _authController.createUserWithEmailAndPassword(
          name: signupName,
          email: signupEmail.trim(),
          password: signupPassword.trim());
      if (_authController.user != null) {
        loading = false;
        Modular.to.pushReplacementNamed('/menu');
      }
    } catch (e) {
      loading = false;
      changeErrorMessage(e.message);
    }
  }

  @action
  Future loginWithEmailAndPassword() async {
    try {
      loading = true;
      await _authController.loginWithEmailPassword(
          email: loginEmail.trim(), password: loginPassword.trim());
      if (_authController.user != null) {
        loading = false;
        Modular.to.pushReplacementNamed('/menu');
      }
    } catch (e) {
      loading = false;
      changeErrorMessage(e.message);
    }
  }

  @action
  Future loginWithGoogle() async {
    try {
      loading = true;
      await _authController.loginWithGoogle();
      if (_authController.user != null) {
        loading = false;
        Modular.to.pushReplacementNamed('/menu');
      }
    } catch (e) {
      loading = false;
      changeErrorMessage(e.message);
    }
  }
}
