import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinito/app/shared/auth_firebase/auth_controller.dart';

class DrawerMenuWidget extends StatelessWidget {
  AuthController _authController = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xfff45d27), Color(0xfff5851f)]),
              ),
              child: Observer(builder: (_) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: _authController.user.photoUrl == null
                          ? Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Icon(Icons.add_a_photo),
                            )
                          : CircleAvatar(
                              radius: 40,
                              backgroundImage:
                                  NetworkImage(_authController.user.photoUrl)),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Olá! Seja bem vindo!"),
                        Text(_authController.user.displayName)
                      ],
                    ),
                  ],
                );
              })),
          CustomListTile(
              icon: Icons.home,
              text: "Pagina inicial",
              onTap: () => Modular.to.pushReplacementNamed("/home")),
          CustomListTile(icon: Icons.person, text: "Perfil", onTap: () {}),
          CustomListTile(
              icon: Icons.local_florist,
              text: "Terapias",
              onTap: () => Modular.to.pushReplacementNamed("/terapias")),
          CustomListTile(
              icon: Icons.turned_in_not, text: "Produtos", onTap: () {}),
          CustomListTile(icon: Icons.timer, text: "agenda", onTap: () {}),
          CustomListTile(
              icon: Icons.local_florist,
              text: "Contato",
              onTap: () => Modular.to.pushReplacementNamed("/contact")),
          CustomListTile(
              icon: Icons.subdirectory_arrow_left,
              text: "Log out",
              onTap: _authController.logout),
        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap;

  const CustomListTile(
      {Key key, @required this.icon, @required this.text, @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 8, 0),
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.orangeAccent,
        child: Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            color: Colors.grey.shade400,
          ))),
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(icon),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(text),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
