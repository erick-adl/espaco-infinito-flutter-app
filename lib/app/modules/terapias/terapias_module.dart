import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinito/app/modules/terapias/terapias_controller.dart';
import 'package:infinito/app/modules/terapias/terapias_page.dart';

class TerapiasModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => TerapiasController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => TerapiasPage()),
      ];

  static Inject get to => Inject<TerapiasModule>.of();
}
