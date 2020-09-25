import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinito/app/modules/wishlist/wishlist_controller.dart';
import 'package:infinito/app/modules/wishlist/wishlist_page.dart';

class WishlistModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => WishlistController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => WishlistPage()),
      ];

  static Inject get to => Inject<WishlistModule>.of();
}
