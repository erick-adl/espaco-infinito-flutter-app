import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinito/app/shared/auth_firebase/auth_controller.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  AuthController _authController = Modular.get();

  @action
  void logoutApp() {
    _authController.logout();
    Modular.to.pushReplacementNamed('/login');
  }
}
