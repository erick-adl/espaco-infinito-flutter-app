import 'package:flutter/material.dart';
import 'package:infinito/common/empty_card.dart';
import 'package:infinito/common/login_card.dart';
import 'package:infinito/common/price_card.dart';
import 'package:infinito/models/cart_manager.dart';
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
      body: Consumer<CartManager>(
        builder: (_, cartManager, __) {
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
                  onPressed: (cartManager.isCartValid ? () {} : null)),
            ],
          );
        },
      ),
    );
  }
}
