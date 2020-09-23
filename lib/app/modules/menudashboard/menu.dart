import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:infinito/app/shared/auth_firebase/auth_controller.dart';
import 'package:infinito/app/shared/widgets/color_loader.dart';
import 'menudashboard_controller.dart';

class Menu extends StatelessWidget {
  final Animation<Offset> slideAnimation;
  final Animation<double> menuAnimation;
  final int selectedIndex;
  final Function onMenuItemClicked;

  final AuthController _authController = Modular.get();

  Menu({
    Key key,
    this.slideAnimation,
    this.menuAnimation,
    this.selectedIndex,
    @required this.onMenuItemClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final indexMenu = Modular.get<MenudashboardController>().index;

    return SlideTransition(
      position: slideAnimation,
      child: ScaleTransition(
          scale: menuAnimation,
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: Theme.of(context).backgroundColor,
            child: Padding(
              padding: const EdgeInsets.only(top: 40, left: 16.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: SingleChildScrollView(
                  child: GetX<MenudashboardController>(
                    builder: (_) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 50,
                                  child: _authController.user.photoUrl == null
                                      ? Icon(
                                          FontAwesomeIcons.userAlt,
                                          size: 40,
                                          color: Colors.white,
                                        )
                                      : CachedNetworkImage(
                                          imageUrl:
                                              _authController.user.photoUrl,
                                          imageBuilder:
                                              (context, imageProvider) =>
                                                  Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          placeholder: (context, url) =>
                                              ColorLoader(),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                        ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10.0,
                                  ),
                                  child: Text(
                                      (_authController.user.displayName ==
                                                  null ||
                                              _authController
                                                      .user.displayName ==
                                                  "")
                                          ? "Olá visitante!"
                                          : "Olá ${_authController.user.displayName.split(" ").first}!",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black54,
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 10.0,
                                    ),
                                    child: Text(
                                      _authController.user.email,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: "Inter",
                                          color: Color(0xFFffa726),
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          ),
                          buildMenuTile(context, "Home", indexMenu.value == 0,
                              () {
                            Modular.get<MenudashboardController>()
                                .setHomePage();
                            onMenuItemClicked();
                          }),
                          SizedBox(height: 30),
                          buildMenuTile(
                              context, "Terapias", indexMenu.value == 1, () {
                            Modular.get<MenudashboardController>()
                                .setTerapiasPage();
                            onMenuItemClicked();
                          }),
                          SizedBox(height: 30),
                          buildMenuTile(
                              context, "Produtos", indexMenu.value == 2, () {
                            Modular.get<MenudashboardController>()
                                .setProductsPage();
                            onMenuItemClicked();
                          }),
                          SizedBox(height: 30),
                          buildMenuTile(
                              context, "Contato", indexMenu.value == 3, () {
                            Modular.get<MenudashboardController>()
                                .setContactPage();
                            onMenuItemClicked();
                          }),
                          SizedBox(height: 30),
                          buildMenuTile(
                              context, "Lista de desejo", indexMenu.value == 4,
                              () {
                            Modular.get<MenudashboardController>()
                                .setWishListtPage();
                            onMenuItemClicked();
                          }),
                          SizedBox(height: 30),
                          buildMenuTile(context, "Sobre", indexMenu.value == 5,
                              () {
                            Modular.get<MenudashboardController>()
                                .setAboutPage();
                            onMenuItemClicked();
                          }),
                          SizedBox(height: 30),
                          GestureDetector(
                            onTap: () => _authController.logout(),
                            child: Text(
                              "Sair",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black54,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 30),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          )),
    );
  }

  GestureDetector buildMenuTile(
      BuildContext context, String title, bool selected, Function f) {
    return GestureDetector(
      onTap: f,
      child: Text(title,
          style: TextStyle(
              fontSize: 18,
              color: selected ? Theme.of(context).primaryColor : Colors.black54,
              fontFamily: "Inter",
              fontWeight: FontWeight.bold)),
    );
  }
}
