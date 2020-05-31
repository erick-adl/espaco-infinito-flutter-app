import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    return SlideTransition(
      position: slideAnimation,
      child: ScaleTransition(
          scale: menuAnimation,
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: Theme.of(context).cardColor,
            child: Padding(
              padding: const EdgeInsets.only(top: 40, left: 16.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: SingleChildScrollView(
                  child: Observer(
                    builder: (context) {
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
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .body1),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 10.0,
                                  ),
                                  child: Text(_authController.user.email,
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .body2),
                                )
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Modular.get<MenudashboardController>()
                                  .setAboutPage();
                              onMenuItemClicked();
                            },
                            child: Text(
                              "Quem somos",
                              style: Modular.get<MenudashboardController>()
                                          .index ==
                                      0
                                  ? Theme.of(context).primaryTextTheme.subtitle
                                  : Theme.of(context).primaryTextTheme.body1,
                            ),
                          ),
                          SizedBox(height: 30),
                          GestureDetector(
                            onTap: () {
                              Modular.get<MenudashboardController>()
                                  .setTerapiasPage();
                              onMenuItemClicked();
                            },
                            child: Text(
                              "Terapias",
                              style: Modular.get<MenudashboardController>()
                                          .index ==
                                      1
                                  ? Theme.of(context).primaryTextTheme.subtitle
                                  : Theme.of(context).primaryTextTheme.body1,
                            ),
                          ),
                          SizedBox(height: 30),
                          GestureDetector(
                            onTap: () {
                              Modular.get<MenudashboardController>()
                                  .setProductsPage();
                              onMenuItemClicked();
                            },
                            child: Text(
                              "Produtos",
                              style: Modular.get<MenudashboardController>()
                                          .index ==
                                      2
                                  ? Theme.of(context).primaryTextTheme.subtitle
                                  : Theme.of(context).primaryTextTheme.body1,
                            ),
                          ),
                          SizedBox(height: 30),
                          GestureDetector(
                            onTap: () {
                              Modular.get<MenudashboardController>()
                                  .setContactPage();
                              onMenuItemClicked();
                            },
                            child: Text(
                              "Contato",
                              style: Modular.get<MenudashboardController>()
                                          .index ==
                                      3
                                  ? Theme.of(context).primaryTextTheme.subtitle
                                  : Theme.of(context).primaryTextTheme.body1,
                            ),
                          ),
                          SizedBox(height: 30),
                          GestureDetector(
                            onTap: () => _authController.logout(),
                            child: Text(
                              "Sair",
                              style: Theme.of(context).primaryTextTheme.body1,
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
}
