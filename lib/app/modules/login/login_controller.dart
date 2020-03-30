import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinito/app/shared/auth_firebase/auth_controller.dart';

import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginBase with _$LoginController;

abstract class _LoginBase with Store {
  AuthController _authController = Modular.get();

  @observable
  bool loading = false;
  @observable
  String email = "";
  @observable
  String password = "";
  @observable
  String errorText = "";

  @action
  changeEmail(String value) => email = value;
  @action
  changePassword(String value) => password = value;
  @action
  changeErrorText(String value) => errorText = value;

  void _clean() {
    changeEmail("");
    changePassword("");
  }

  @action
  Future<void> formCheck() async {
    try {
      if (email.isEmpty || password.isEmpty) {
        changeErrorText("Preencha todos os compos");
      } else if (email.length < 7 || password.length < 7)
        changeErrorText("Nenhum campo deve ser inferior a 7");
      else if (!email.contains("@") ||
          !email.contains("com") ||
          !email.contains(".")) changeErrorText("Formato de email incorreto");
      loading = true;
      await _authController.loginWithEmailPassword(
          email: email.trim(), password: password.trim());

      print("OOOOOOKKKK");
      _clean();
      loading = false;
      Modular.to.pushReplacementNamed('/home/');
    } catch (e) {
      loading = false;
      if (e.code == "ERROR_WRONG_PASSWORD") changeErrorText("Senha incorreta");
      if (e.code == "ERROR_USER_NOT_FOUND")
        changeErrorText("Usuario não encontrado");
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
