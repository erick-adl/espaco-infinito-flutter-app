import 'cursos_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'cursos_page.dart';

class CursosModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CursosController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => CursosPage()),
      ];

  static Inject get to => Inject<CursosModule>.of();
}
