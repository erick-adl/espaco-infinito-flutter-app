import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinito/app/modules/terapias/terapias_controller.dart';
import 'package:infinito/app/modules/terapias/terapias_page.dart';

class TerapiasModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        Bind((i) => TerapiasController()),
      ];

  static Inject get to => Inject<TerapiasModule>.of();

  @override
  Widget get view => TerapiasPage();
}
