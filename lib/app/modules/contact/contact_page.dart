import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinito/app/shared/widgets/custom_button.widget.dart';
import 'package:infinito/app/shared/widgets/custom_scaffold.dart';

import 'package:infinito/app/shared/widgets/custom_textfield.widget.dart';
import 'package:infinito/app/shared/widgets/custon_drawer_menu_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'contact_controller.dart';

class ContactPage extends StatefulWidget {
  final String title;
  const ContactPage({Key key, this.title = "Contato"}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends ModularState<ContactPage, ContactController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      page: contactPage(),
      title: widget.title,
    );
  }

  contactPage() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Theme.of(context).primaryColor,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Image(
                image: AssetImage('assets/images/logo_infinito.png'),
                height: 150,
                width: 150,
              ),
            ),
            InkWell(
              onTap: () => _launchInBrowser(
                  "https://www.google.com/maps/place/Espa%C3%A7o+infinito+-+Terapias+Alternativas+E+Produtos+Hol%C3%ADsticos/@-29.9514781,-50.9957021,15z/data=!4m5!3m4!1s0x0:0xbaf2539391a38a9c!8m2!3d-29.9514781!4d-50.9957021"),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                    child: Text(
                      "Nosso endereço fica na Av. Centenário n° 555",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                    child: Text(
                      "Bairro Passo das Pedras",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                    child: Text(
                      "Gravataí/RS – CEP 94035-240",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: Observer(
                builder: (BuildContext context) {
                  return (controller.errorText == null ||
                          controller.errorText.isEmpty)
                      ? Text(
                          "Entre em contato",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        )
                      : Text(
                          controller.errorText,
                          style: TextStyle(color: Colors.white),
                        );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: CustomTextFieldWidget(
                  context: context,
                  textHint: "Nome",
                  iconDecoration: null,
                  onChanged: controller.changeName,
                  obscureText: false,
                  textInputType: TextInputType.text),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: CustomTextFieldWidget(
                  context: context,
                  textHint: "E-mail",
                  iconDecoration: null,
                  onChanged: controller.changeEmail,
                  obscureText: false,
                  textInputType: TextInputType.text),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Container(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 5),
                margin: EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 5)
                    ]),
                width: MediaQuery.of(context).size.width / 1.2,
                height: 150,
                child: TextField(
                  keyboardType: TextInputType.text,
                  obscureText: false,
                  onChanged: controller.changeMessage,
                  decoration: InputDecoration(
                      hintText: "Mensagem", border: InputBorder.none),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: CustomButton(
                    context: context,
                    text: "Enviar",
                    onPressed: () => controller.sendEmail()))
          ],
        ),
      ),
    );
  }
}

Future<void> _launchInBrowser(String url) async {
  if (await canLaunch(url)) {
    await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
    );
  } else {
    throw 'Could not launch $url';
  }
}
