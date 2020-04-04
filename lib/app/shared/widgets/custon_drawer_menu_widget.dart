import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infinito/app/shared/auth_firebase/auth_controller.dart';

class CustonDrawerMenuWidget extends StatelessWidget {
  final AuthController _authController = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                      _authController.user.photoUrl == null
                          ? Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Icon(Icons.add_a_photo),
                            )
                          : CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  NetworkImage(_authController.user.photoUrl)),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10.0,
                        ),
                        child: Text(
                          "Olá! Seja bem vindo!",
                          style:
                              TextStyle(color: Theme.of(context).accentColor),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 10.0,
                        ),
                        child: Text(
                          _authController.user.displayName == null
                              ? ""
                              : _authController.user.displayName,
                          style:
                              TextStyle(color: Theme.of(context).accentColor),
                        ),
                      )
                    ],
                  ),
                );
              }),
              _customMenuTile(
                  context: context,
                  icon: Icons.home,
                  text: "Pagina Inicial",
                  onTap: () => Modular.to.pushReplacementNamed("/home")),
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
                  onTap: () => Modular.to.pushReplacementNamed("/terapias")),
              SizedBox(height: 10),
              _customMenuTile(
                  context: context,
                  icon: FontAwesomeIcons.productHunt,
                  text: "Produtos",
                  onTap: () {},
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
            color: Theme.of(context).accentColor,
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 20,
                color: used
                    ? Theme.of(context).accentColor
                    : Theme.of(context).unselectedWidgetColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
