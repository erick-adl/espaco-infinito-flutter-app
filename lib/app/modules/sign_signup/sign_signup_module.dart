import 'package:infinito/app/modules/sign_signup/sign_signup_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinito/app/modules/sign_signup/sign_signup_page.dart';

class SignSignupModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SignSignupController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => SignSignupPage()),
      ];

  static Inject get to => Inject<SignSignupModule>.of();
}
