import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infinito/app/shared/auth_firebase/auth_controller.dart';
import 'package:infinito/app/shared/widgets/color_loader.dart';

class CustomDrawer extends StatelessWidget {
  final Function closeDrawer;

  const CustomDrawer({Key key, this.closeDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    AuthController _authController = Modular.get();
    return Container(
      color: Colors.white,
      width: mediaQuery.size.width * 0.60,
      height: mediaQuery.size.height,
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 150,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: CircleAvatar(
                    radius: 30,
                    child: _authController.user.photoUrl == null
                        ? Icon(
                            FontAwesomeIcons.userAlt,
                            size: 25,
                            color: Colors.white,
                          )
                        : CachedNetworkImage(
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
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                    ),
                    child: Text(
                        (_authController.user.displayName == null ||
                                _authController.user.displayName == "")
                            ? "Olá visitante!"
                            : "Olá ${_authController.user.displayName.split(" ").first}!",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Center(
                  child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10.0,
                      ),
                      child: Text(
                        _authController.user.email,
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Inter",
                            color: Color(0xFFffa726),
                            fontWeight: FontWeight.bold),
                      )),
                )
              ],
            ),
          ),
          buildListTile(
              text: "Cursos e Palestras",
              icon: FontAwesomeIcons.university,
              onTap: () {
                debugPrint("Tapped Cursos e Palestras");
                Modular.to.pushNamed("/cursos");
              }),
          buildListTile(
              text: "Terapias",
              icon: FontAwesomeIcons.commentMedical,
              onTap: () {
                debugPrint("Tapped Terapias");
                closeDrawer();
                Modular.to.pushNamed("/terapias");
              }),
          buildListTile(
              text: "Produtos",
              icon: Icons.local_grocery_store,
              onTap: () {
                debugPrint("Tapped Produtos");
                closeDrawer();
                Modular.to.pushNamed("/produtos");
              }),
          buildListTile(
              text: "Lista de desejos",
              icon: FontAwesomeIcons.solidHeart,
              onTap: () {
                debugPrint("Tapped sobre");
                closeDrawer();
                Modular.to.pushNamed("/wish_list");
              }),
          buildListTile(
              text: "Contato",
              icon: FontAwesomeIcons.book,
              onTap: () {
                debugPrint("Tapped Contato");
                closeDrawer();
                Modular.to.pushNamed("/contato");
              }),
          buildListTile(
              text: "Sobre",
              icon: FontAwesomeIcons.infinity,
              onTap: () {
                debugPrint("Tapped sobre");
                closeDrawer();
                Modular.to.pushNamed("/sobre");
              }),
          buildListTile(
              text: "Sair",
              icon: FontAwesomeIcons.signOutAlt,
              onTap: () {
                debugPrint("Tapped Sair");
                _authController.logout();
              }),
        ],
      ),
    );
  }

  ListTile buildListTile({String text, IconData icon, Function onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon),
      title: Text(
        text,
        style: TextStyle(
            fontSize: 16,
            color: Colors.black54,
            fontFamily: "Inter",
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
