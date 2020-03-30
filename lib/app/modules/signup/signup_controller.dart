import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinito/app/shared/auth_firebase/auth_controller.dart';
import 'package:mobx/mobx.dart';

part 'signup_controller.g.dart';

class SignupController = _SignupControllerBase with _$SignupController;

abstract class _SignupControllerBase with Store {
  AuthController _authController = Modular.get();

  @observable
  String name = "";
  @observable
  String email = "";
  @observable
  String password = "";
  @observable
  String passwordCheck = "";
  @observable
  String errorText = "";
  @observable
  String successText = "";

  @action
  changeName(String value) => name = value;
  @action
  changeEmail(String value) => email = value;
  @action
  changePassword(String value) => password = value;
  @action
  changePasswordCheck(String value) => passwordCheck = value;
  @action
  changeErrorText(String value) => errorText = value;

  @action
  Future<void> isValidForm() async {
    errorText = await formCheck();

    if (errorText == null) {
      clean();
      successText = "Cadastro realizado com sucesso!";
      Future.delayed(Duration(seconds: 4))
          .then((onValue) => Modular.to.pushReplacementNamed('/login/'));
    }
  }

  void clean() {
    changeName("");
    changeEmail("");
    changePassword("");
    changePasswordCheck("");
  }

  Future<String> formCheck() async {
    try {
      if (name.isEmpty ||
          email.isEmpty ||
          password.isEmpty ||
          passwordCheck.isEmpty) {
        return "Preencha todos os compos";
      } else if (name.length < 7 ||
          email.length < 7 ||
          password.length < 7 ||
          passwordCheck.length < 7)
        return "Nenhum campo deve ser inferior a 7";
      else if (!email.contains("@") ||
          !email.contains("com") ||
          !email.contains("."))
        return "Formato de email incorreto";
      else if (password != passwordCheck) return "Senhas diferentes";

      var user = await _authController.createUserWithEmailAndPassword(
          email: email.trim(), password: passwordCheck.trim());
      if (user != null) return "Usuario já possui cadastro";

      return null;
    } catch (e) {
      if (e.code == "ERROR_INVALID_EMAIL") return "Email já possui cadastro";
    }
  }
}
