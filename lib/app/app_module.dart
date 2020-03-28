import 'package:infinito/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:infinito/app/app_widget.dart';
import 'package:infinito/app/modules/home/home_module.dart';
import 'package:infinito/app/shared/auth/auth_controller.dart';
import 'package:infinito/app/shared/auth/auth_repository.dart';
import 'package:infinito/app/shared/auth/auth_repository_interface.dart';
import 'package:infinito/app/shared/repositories/localstorage/local_storage_interface.dart';
import 'package:infinito/app/shared/repositories/localstorage/local_storage_share.dart';
import 'package:infinito/app/shared/splash/splash_page.dart';

import 'modules/login/login_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        //  Bind((i) => LocalStorageHive()),
        Bind<ILocalStorage>((i) => LocalStorageShared()),
        Bind<IAuthRepository>((i) => AuthRepository()),
        Bind((i) => AuthController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => SplashPage()),
        Router('/login',
            module: LoginModule(), transition: TransitionType.noTransition),
        Router('/home', module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
