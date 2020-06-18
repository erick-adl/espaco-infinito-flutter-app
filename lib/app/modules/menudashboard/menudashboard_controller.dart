import 'package:flutter/material.dart';
import 'package:infinito/app/modules/about/about_module.dart';
import 'package:infinito/app/modules/contact/contact_module.dart';
import 'package:infinito/app/modules/products/products_module.dart';
import 'package:infinito/app/modules/terapias/terapias_module.dart';
import 'package:infinito/app/modules/wishlist/wishlist_module.dart';
import 'package:mobx/mobx.dart';

part 'menudashboard_controller.g.dart';

class MenudashboardController = _MenudashboardControllerBase
    with _$MenudashboardController;

abstract class _MenudashboardControllerBase with Store {
  @observable
  Widget page = AboutModule();

  @observable
  int index = 0;

  @observable
  String pageName = "Terapias";

  @action
  setAboutPage() {
    page = AboutModule();
    index = 0;
    pageName = "O espaço";
  }

  @action
  setTerapiasPage() {
    page = TerapiasModule();
    index = 1;
    pageName = "Terapias";
  }

  @action
  setProductsPage() {
    page = ProductsModule();
    index = 2;
    pageName = "Produtos";
  }

  @action
  setContactPage() {
    page = ContactModule();
    index = 3;
    pageName = "Contato";
  }

  @action
  setWishListtPage() {
    page = WishlistModule();
    index = 4;
    pageName = "Lista de desejos";
  }
}
