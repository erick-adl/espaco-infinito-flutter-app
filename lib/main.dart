import 'package:flutter/material.dart';
import 'package:infinito/models/admin_users_manager.dart';
import 'package:infinito/models/cart_manager.dart';
import 'package:infinito/models/home_manager.dart';
import 'package:infinito/models/product.dart';
import 'package:infinito/models/product_manager.dart';
import 'package:infinito/models/stores_manager.dart';
import 'package:infinito/models/therapies_manager.dart';
import 'package:infinito/models/therapy.dart';
import 'package:infinito/models/user_manager.dart';
import 'package:infinito/screens/base/base_screen.dart';
import 'package:infinito/screens/cart/cart_screen.dart';
import 'package:infinito/screens/edit_product/edit_product_screen.dart';
import 'package:infinito/screens/edit_therapy/edit_therapy_screen.dart';
import 'package:infinito/screens/login/login_screen.dart';
import 'package:infinito/screens/product/product_screen.dart';
import 'package:infinito/screens/select_product/select_product_screen.dart';
import 'package:infinito/screens/signup/signup_screen.dart';
import 'package:infinito/screens/therapy/therapy_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => ProductManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => TherapiesManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => HomeManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => StoresManager(),
        ),
        ChangeNotifierProxyProvider<UserManager, CartManager>(
          create: (_) => CartManager(),
          lazy: false,
          update: (_, userManager, cartManager) =>
              cartManager..updateUser(userManager),
        ),
        ChangeNotifierProxyProvider<UserManager, AdminUsersManager>(
          create: (_) => AdminUsersManager(),
          lazy: false,
          update: (_, userManager, adminUsersManager) =>
              adminUsersManager..updateUser(userManager),
        ),
      ],
      child: MaterialApp(
        // title: 'Loja do Erick',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // primaryColor: Color.fromARGB(255, 42, 30, 101),
          primaryColor: Color.fromARGB(255, 219, 135, 30),
          scaffoldBackgroundColor: Color.fromARGB(255, 219, 135, 30),
          appBarTheme: const AppBarTheme(elevation: 0),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/login':
              return MaterialPageRoute(builder: (_) => LoginScreen());
            case '/signup':
              return MaterialPageRoute(builder: (_) => SignUpScreen());
            case '/product':
              return MaterialPageRoute(
                  builder: (_) => ProductScreen(settings.arguments as Product));
            case '/therapy':
              return MaterialPageRoute(
                  builder: (_) => TherapyScreen(settings.arguments as Therapy));
            case '/cart':
              return MaterialPageRoute(
                  builder: (_) => CartScreen(), settings: settings);

            case '/edit_product':
              return MaterialPageRoute(
                  builder: (_) =>
                      EditProductScreen(settings.arguments as Product));

            case '/edit_therapy':
              return MaterialPageRoute(
                  builder: (_) =>
                      EditTherapyScreen(settings.arguments as Therapy));
            case '/select_product':
              return MaterialPageRoute(builder: (_) => SelectProductScreen());

            case '/':
            default:
              return MaterialPageRoute(
                  builder: (_) => BaseScreen(), settings: settings);
          }
        },
      ),
    );
  }
}
