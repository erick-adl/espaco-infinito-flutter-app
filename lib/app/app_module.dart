import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:infinito/app/app_widget.dart';
import 'package:infinito/app/modules/forgot_password/forgot_password_module.dart';
import 'package:infinito/app/modules/terapias/terapias_page_details.dart';
import 'package:infinito/app/modules/wishlist/wishlist_detail_page.dart';
import 'package:infinito/app/shared/auth_firebase/auth_controller.dart';
import 'package:infinito/app/shared/auth_firebase/auth_firebase.dart';
import 'package:infinito/app/shared/auth_firebase/auth_firebase_interface.dart';
import 'package:infinito/app/shared/firestore/firestore_database.dart';
import 'package:infinito/app/shared/firestore/firestore_database_interface.dart';

import 'package:infinito/app/shared/splash/splash_page.dart';
import 'modules/menudashboard/menudashboard_module.dart';
import 'modules/products/product_detail_page.dart';
import 'modules/sign_signup/sign_signup_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        //  Bind((i) => LocalStorageHive()),

        Bind<IAuthFirebase>((i) => AuthFirebase()),
        Bind<IFirestoreDatabase>((i) => FirestoreDatabase()),
        Bind((i) => AuthController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => SplashPage()),
        Router('/terapia_details',
            child: (_, args) => TerapiasPageDetails(
                  document: args.data,
                )),
        Router('/product_detail',
            child: (_, args) => ProductDetailPage(
                  document: args.data,
                )),
        Router('/wish_detail',
            child: (_, args) => WishlistDetailPage(
                  document: args.data,
                )),
        Router('/login', module: SignSignupModule()),
        Router('/forgot', module: ForgotPasswordModule()),
        Router('/menu', module: MenuDashboardModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
