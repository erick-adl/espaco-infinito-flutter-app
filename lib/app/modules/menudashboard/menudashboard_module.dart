import 'package:flutter_modular/flutter_modular.dart';
import 'menudashboard_controller.dart';
import 'menudashboard_page.dart';

class MenuDashboardModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MenudashboardController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => MenudashboardPage()),
      ];

  static Inject get to => Inject<MenuDashboardModule>.of();
}
