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
      if (signupName.isEmpty)
        changeErrorMessage("Campo Nome em branco");
      else if (signupName.length < 2)
        changeErrorMessage("Formato de nome incorreto");
      else if (signupEmail.isEmpty)
        changeErrorMessage("Campo Email em branco");
      else if (signupEmail.length < 7 ||
          !signupEmail.contains("@") ||
          !signupEmail.contains("com") ||
          !signupEmail.contains("."))
        changeErrorMessage("Formato de email incorreto");
      else if (signupPassword.isEmpty)
        changeErrorMessage("Campo senha em branco");
      else if (signupPassword.length < 6)
        changeErrorMessage("Senha não deve ser inferior a 6 digitos");
      else if (signupPasswordCheck.isEmpty)
        changeErrorMessage("Campo confirmar senha em branco");
      else if (signupPasswordCheck.length < 6)
        changeErrorMessage("Senha não deve ser inferior a 6 digitos");
      else if (signupPasswordCheck.trim() != signupPassword.trim())
        changeErrorMessage("Senha não identicas");
      else {
        loading = true;
        await _authController.createUserWithEmailAndPassword(
            name: signupName,
            email: signupEmail.trim(),
            password: signupPassword.trim());
        loading = false;
        Modular.to.pushReplacementNamed("/home");
      }
    } catch (e) {
      loading = false;
      if (e.code == "ERROR_EMAIL_ALREADY_IN_USE")
        changeErrorMessage("Email já possui cadastro");
      else {
        changeErrorMessage("Falha ao cadastrar...");
      }
    }
  }

  @action
  Future loginWithEmailAndPassword() async {
    try {
      if (loginEmail.isEmpty)
        changeErrorMessage("Digite seu Email");
      else if (loginEmail.length < 7 ||
          !loginEmail.contains("@") ||
          !loginEmail.contains("com") ||
          !loginEmail.contains("."))
        changeErrorMessage("Formato de email incorreto");
      else if (loginPassword.isEmpty)
        changeErrorMessage("Digite sua senha");
      else if (loginPassword.length < 6)
        changeErrorMessage("Senha não deve ser inferior a 6 digitos");
      else {
        loading = true;
        await _authController.loginWithEmailPassword(
            email: loginEmail.trim(), password: loginPassword.trim());
        loading = false;
        Modular.to.pushReplacementNamed("/home");
      }
    } catch (e) {
      loading = false;
      if (e.code == "ERROR_WRONG_PASSWORD")
        changeErrorMessage("Senha incorreta");
      else if (e.code == "ERROR_USER_NOT_FOUND")
        changeErrorMessage("Usuario não encontrado");
      else
        changeErrorMessage("Falha ao relalizar login..");
    }
  }

  @action
  Future loginWithGoogle() async {
    try {
      loading = true;
      await _authController.loginWithGoogle();
      Modular.to.pushReplacementNamed('/home');
    } catch (e) {
      loading = false;
    }
  }
}
