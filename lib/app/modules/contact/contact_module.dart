import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinito/app/modules/contact/contact_page.dart';

class ContactModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        // Bind((i) => ContactController()),
      ];

  // @override
  // List<Router> get routers => [
  //       Router(Modular.initialRoute, child: (_, args) => ContactPage()),
  //     ];

  // static Inject get to => Inject<ContactModule>.of();

  @override
  Widget get view => ContactPage();
}
