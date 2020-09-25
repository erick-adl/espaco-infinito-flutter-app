import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/state_manager.dart';
import 'package:infinito/app/shared/auth_firebase/auth_controller.dart';

class SignSignupController extends GetxController {
  AuthController _authController = Modular.get();

  final loading = false.obs;

  final errorMessage = "".obs;

  changeErrorMessage(String value) => errorMessage.value = value;

  //signUp

  final signupName = "".obs;

  final signupEmail = "".obs;

  final signupPassword = "".obs;

  final signupPasswordCheck = "".obs;

  signupChangeName(String value) => signupName.value = value;

  signupChangeEmail(String value) => signupEmail.value = value;

  signupChangePassword(String value) => signupPassword.value = value;

  signupChangePasswordCheck(String value) => signupPasswordCheck.value = value;

  //login

  final loginEmail = "".obs;

  final loginPassword = "".obs;

  loginChangeEmail(String value) => loginEmail.value = value;

  loginChangePassword(String value) => loginPassword.value = value;

  void _clean() {
    signupName.value = "";
    signupEmail.value = "";
    signupPassword.value = "";
    signupPasswordCheck.value = "";
    loginEmail.value = "";
    loginPassword.value = "";
  }

  Future register() async {
    try {
      loading.value = true;
      await _authController.createUserWithEmailAndPassword(
          name: signupName.value,
          email: signupEmail.value.trim(),
          password: signupPassword.value.trim());
      if (_authController.user != null) {
        loading.value = false;
        Modular.to.pushReplacementNamed('/home');
      }
    } catch (e) {
      loading.value = false;
      changeErrorMessage(e.message);
    }
  }

  Future loginWithEmailAndPassword() async {
    try {
      loading.value = true;
      await _authController.loginWithEmailPassword(
          email: loginEmail.value.trim(), password: loginPassword.value.trim());
      if (_authController.user != null) {
        loading.value = false;
        Modular.to.pushReplacementNamed('/home');
      }
    } catch (e) {
      loading.value = false;
      changeErrorMessage(e.message);
    }
  }

  Future loginWithGoogle() async {
    try {
      loading.value = true;
      await _authController.loginWithGoogle();
      if (_authController.user != null) {
        loading.value = false;
        Modular.to.pushReplacementNamed('/home');
      }
    } catch (e) {
      loading.value = false;
      changeErrorMessage(e.message);
    }
  }
}
