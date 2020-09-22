import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinito/app/modules/products/products_controller.dart';

import 'home_controller.dart';
import 'home_page.dart';

class HomeModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
        Bind((i) => ProductsController()),
      ];

  static Inject get to => Inject<HomeModule>.of();

  @override
  Widget get view => HomePage();
}
