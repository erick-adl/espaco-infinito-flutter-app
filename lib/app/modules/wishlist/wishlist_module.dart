import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinito/app/modules/wishlist/wishlist_controller.dart';
import 'package:infinito/app/modules/wishlist/wishlist_page.dart';

class WishlistModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        Bind((i) => WishlistController()),
      ];

  static Inject get to => Inject<WishlistModule>.of();

  @override
  Widget get view => WishlistPage();
}
