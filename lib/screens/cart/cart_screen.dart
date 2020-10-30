import 'package:flutter/material.dart';
import 'package:infinito/common/empty_card.dart';
import 'package:infinito/common/login_card.dart';
import 'package:infinito/common/price_card.dart';
import 'package:infinito/helpers/url_lauch.dart';
import 'package:infinito/models/cart_manager.dart';
import 'package:infinito/models/stores_manager.dart';
import 'package:infinito/screens/cart/components/cart_tile.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
        centerTitle: true,
      ),
      body: Consumer2<CartManager, StoresManager>(
        builder: (_, cartManager, storesManager, __) {
          if (cartManager.user == null) {
            return LoginCard();
          }

          if (cartManager.items.isEmpty) {
            return EmptyCard(
              iconData: Icons.remove_shopping_cart,
              title: 'Nenhum produto no carrinho!',
            );
          }

          return ListView(
            children: <Widget>[
              Column(
                children: cartManager.items
                    .map((cartProduct) => CartTile(cartProduct))
                    .toList(),
              ),
              PriceCard(
                  buttonText: 'Finalizar pedido por WhatsApp',
                  onPressed: (cartManager.isCartValid
                      ? () {
                          var listName = cartManager.items
                              .map((e) => '${e.product.name}%0A')
                              .toList()
                              .join();
                          // listName = listName.substring(1, listName.length);
                          final contactNumber =
                              storesManager.stores.first.whatsapp;

                          UrlLauch.launchInBrowser(
                              "https://api.whatsapp.com/send?phone=$contactNumber&text=Ol%C3%A1!%20Gostaria%20de%20comprar%20os%20seguintes%20itens:%0A" +
                                  listName);
                        }
                      : null)),
            ],
          );
        },
      ),
    );
  }
}
