import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinito/app/modules/products/products_controller.dart';
import 'package:infinito/app/modules/products/products_page.dart';

class ProductsModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ProductsController()),
      ];

  static Inject get to => Inject<ProductsModule>.of();

  @override
  Widget get view => ProductsPage();
}
