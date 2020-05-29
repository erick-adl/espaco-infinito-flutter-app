import 'package:infinito/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:infinito/app/app_widget.dart';
import 'package:infinito/app/modules/contact/contact_module.dart';
import 'package:infinito/app/modules/forgot_password/forgot_password_module.dart';
import 'package:infinito/app/modules/home/home_module.dart';
import 'package:infinito/app/modules/products/products_module.dart';
import 'package:infinito/app/modules/terapias/terapias_module.dart';
import 'package:infinito/app/modules/terapias/terapias_page_details.dart';
import 'package:infinito/app/shared/auth_firebase/auth_controller.dart';
import 'package:infinito/app/shared/auth_firebase/auth_firebase.dart';
import 'package:infinito/app/shared/auth_firebase/auth_firebase_interface.dart';
import 'package:infinito/app/shared/repositories/localstorage/local_storage_interface.dart';
import 'package:infinito/app/shared/repositories/localstorage/local_storage_share.dart';
import 'package:infinito/app/shared/splash/splash_page.dart';

import 'modules/products/product_detail_page.dart';
import 'modules/sign_signup/sign_signup_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        //  Bind((i) => LocalStorageHive()),
        Bind<ILocalStorage>((i) => LocalStorageShared()),
        Bind<IAuthFirebase>((i) => AuthFirebase()),
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

        // Router('/login', module: LoginModule()),
        Router('/login', module: SignSignupModule()),
        Router('/about', module: HomeModule()),

        Router('/forgot', module: ForgotPasswordModule()),
        Router('/home', module: TerapiasModule()),
        Router('/contact', module: ContactModule()),

        Router('/products', module: ProductsModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
