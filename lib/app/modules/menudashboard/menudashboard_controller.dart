import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:infinito/app/modules/about/about_module.dart';
import 'package:infinito/app/modules/contact/contact_module.dart';
import 'package:infinito/app/modules/home/home_module.dart';
import 'package:infinito/app/modules/products/products_module.dart';
import 'package:infinito/app/modules/terapias/terapias_module.dart';
import 'package:infinito/app/modules/wishlist/wishlist_module.dart';

class MenudashboardController extends GetxController {
  Widget page = HomeModule();

  final index = 0.obs;

  final pageName = "Home".obs;

  setHomePage() {
    page = HomeModule();
    index.value = 0;
    pageName.value = "Home";
  }

  setTerapiasPage() {
    page = TerapiasModule();
    index.value = 1;
    pageName.value = "Terapias";
  }

  setProductsPage() {
    page = ProductsModule();
    index.value = 2;
    pageName.value = "Produtos";
  }

  setContactPage() {
    page = ContactModule();
    index.value = 3;
    pageName.value = "Contato";
  }

  setWishListtPage() {
    page = WishlistModule();
    index.value = 4;
    pageName.value = "Lista de desejos";
  }

  setAboutPage() {
    page = AboutModule();
    index.value = 5;
    pageName.value = "O espaço";
  }
}
