import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infinito/app/shared/auth_firebase/auth_controller.dart';

import 'color_loader.dart';

class CustonDrawerMenuWidget extends StatelessWidget {
  final AuthController _authController = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Observer(builder: (_) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 50,
                          child: CachedNetworkImage(
                            imageUrl: _authController.user.photoUrl,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            placeholder: (context, url) => ColorLoader(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10.0,
                          ),
                          child: Text(
                              _authController.user.displayName == null
                                  ? "Olá Visitante!"
                                  : "Olá ${_authController.user.displayName.split(" ").first}!",
                              style: Theme.of(context).primaryTextTheme.body1),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 10.0,
                          ),
                          child: Text(_authController.user.email,
                              style: Theme.of(context).primaryTextTheme.body2),
                        )
                      ],
                    ),
                  );
                }),
                _customMenuTile(
                    context: context,
                    icon: Icons.home,
                    text: "Quem somos",
                    onTap: () => Modular.to.pushReplacementNamed("/about")),
                SizedBox(height: 10),
                _customMenuTile(
                    context: context,
                    icon: Icons.person,
                    text: "Perfil",
                    onTap: () {},
                    used: false),
                SizedBox(height: 10),
                _customMenuTile(
                    context: context,
                    icon: FontAwesomeIcons.dna,
                    text: "Terapias",
                    onTap: () => Modular.to.pushReplacementNamed("/home")),
                SizedBox(height: 10),
                _customMenuTile(
                    context: context,
                    icon: FontAwesomeIcons.productHunt,
                    text: "Produtos",
                    onTap: () => Modular.to.pushReplacementNamed("/products"),
                    used: false),
                SizedBox(height: 10),
                _customMenuTile(
                    context: context,
                    icon: FontAwesomeIcons.bookOpen,
                    text: "Agenda",
                    onTap: () {},
                    used: false),
                SizedBox(height: 10),
                _customMenuTile(
                    context: context,
                    icon: FontAwesomeIcons.phoneAlt,
                    text: "Contato",
                    onTap: () => Modular.to.pushReplacementNamed("/contact")),
                SizedBox(height: 10),
                _customMenuTile(
                    context: context,
                    icon: FontAwesomeIcons.arrowCircleLeft,
                    text: "Sair",
                    onTap: () => _authController.logout()),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _customMenuTile(
      {BuildContext context,
      IconData icon,
      String text,
      Function onTap,
      bool used = true}) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: <Widget>[
          Icon(
            icon,
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              text,
              style: Theme.of(context).primaryTextTheme.body1,
            ),
          )
        ],
      ),
    );
  }
}
