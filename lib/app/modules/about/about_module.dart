import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'about_page.dart';

class AboutModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        // Bind((i) => AboutController()),
      ];

  // @override
  // List<Router> get routers => [
  //       Router(Modular.initialRoute, child: (_, args) => AboutPage()),
  //     ];

  // static Inject get to => Inject<AboutModule>.of();

  @override
  Widget get view => AboutPage();
}
