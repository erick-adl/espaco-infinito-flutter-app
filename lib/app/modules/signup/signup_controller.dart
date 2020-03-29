import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'signup_controller.g.dart';

class SignupController = _SignupControllerBase with _$SignupController;

abstract class _SignupControllerBase with Store {
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
  void isValidForm() {
    errorText = formCheck();

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

  String formCheck() {
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
    else if (password != passwordCheck)
      return "Senhas diferentes";
    else
      return null;
  }
}
