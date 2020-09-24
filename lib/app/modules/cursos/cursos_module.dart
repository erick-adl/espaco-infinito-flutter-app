import 'package:flutter/material.dart';
import 'cursos_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'cursos_page.dart';

class CursosModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CursosController()),
      ];

  static Inject get to => Inject<CursosModule>.of();

  @override
  Widget get view => CursosPage();
}
