import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infinito/models/page_manager.dart';
import 'package:infinito/models/user_manager.dart';
import 'package:infinito/screens/admin_users/admin_users_screen.dart';
import 'package:infinito/screens/home/home_screen.dart';
import 'package:infinito/screens/products/products_screen.dart';
import 'package:infinito/screens/stores/stores_screen.dart';
import 'package:infinito/screens/tharapies/therapies_screen.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    configFCM();
  }

  void configFCM() {
    final fcm = FirebaseMessaging();

    if (Platform.isIOS) {
      fcm.requestNotificationPermissions(
          const IosNotificationSettings(provisional: true));
    }

    fcm.configure(onLaunch: (Map<String, dynamic> message) async {
      print('onLaunch $message');
    }, onResume: (Map<String, dynamic> message) async {
      print('onResume $message');
    }, onMessage: (Map<String, dynamic> message) async {
      showNotification(
        message['notification']['title'] as String,
        message['notification']['body'] as String,
      );
    });
  }

  void showNotification(String title, String message) {
    Flushbar(
      title: title,
      message: message,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.GROUNDED,
      isDismissible: true,
      backgroundColor: Theme.of(context).primaryColor,
      duration: const Duration(seconds: 5),
      icon: Icon(
        Icons.shopping_cart,
        color: Colors.white,
      ),
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (_) => PageManager(pageController),
        child: Consumer2<UserManager, PageManager>(
          builder: (_, userManager, pageManager, __) {
            return Scaffold(
              body: PageView(
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: <Widget>[
                  HomeScreen(),
                  ProductsScreen(),
                  TherapiesScreen(),
                  StoresScreen(),
                  if (userManager.adminEnabled) ...[
                    AdminUsersScreen(),
                  ]
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: pageManager.page,
                onTap: (index) {
                  pageManager.setPage(index);
                  setState(() {});
                },
                items: [
                  BottomNavigationBarItem(
                      icon: new Icon(Icons.home), title: new Text('Início')),
                  BottomNavigationBarItem(
                    icon: new Icon(Icons.list),
                    title: new Text('Produtos'),
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.star), title: Text('Terapias')),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.location_on), title: Text('Nossa loja')),
                  if (userManager.adminEnabled)
                    BottomNavigationBarItem(
                        icon: Icon(Icons.supervisor_account),
                        title: Text('Users')),
                ],
              ),
            );
          },
        ));
  }

  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
          icon: new Icon(Icons.home), title: new Text('Início')),
      BottomNavigationBarItem(
        icon: new Icon(Icons.list),
        title: new Text('Produtos'),
      ),
      BottomNavigationBarItem(icon: Icon(Icons.star), title: Text('Terapias')),
      BottomNavigationBarItem(
          icon: Icon(Icons.location_on), title: Text('Nossa loja')),
    ];
  }
}
