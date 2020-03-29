import 'package:infinito/app/modules/forgot_password/forgot_password_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinito/app/modules/forgot_password/forgot_password_page.dart';

class ForgotPasswordModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ForgotPasswordController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ForgotPasswordPage()),
      ];

  static Inject get to => Inject<ForgotPasswordModule>.of();
}
