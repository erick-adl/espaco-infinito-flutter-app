import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinito/app/modules/products/products_controller.dart';
import 'package:infinito/app/modules/products/products_page.dart';

class ProductsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ProductsController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ProductsPage()),
      ];

  static Inject get to => Inject<ProductsModule>.of();
}
