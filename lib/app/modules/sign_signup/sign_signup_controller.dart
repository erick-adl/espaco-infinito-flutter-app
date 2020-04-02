import 'package:mobx/mobx.dart';

part 'sign_signup_controller.g.dart';

class SignSignupController = _SignSignupControllerBase
    with _$SignSignupController;

abstract class _SignSignupControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
