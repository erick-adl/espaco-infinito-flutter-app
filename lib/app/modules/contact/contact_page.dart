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
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          color: Theme.of(context).primaryColor,
          padding: EdgeInsets.only(top: 10),
          child: InkWell(
            onTap: () => _launchInBrowser(
                "https://www.google.com/maps/place/Espa%C3%A7o+infinito+-+Terapias+Alternativas+E+Produtos+Hol%C3%ADsticos/@-29.9514781,-50.9957021,15z/data=!4m5!3m4!1s0x0:0xbaf2539391a38a9c!8m2!3d-29.9514781!4d-50.9957021"),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Text(
                    "Nosso endereço fica na Av. José Loureiro da Silva n° 1799",
                    style: Theme.of(context).accentTextTheme.body1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                  child: Text(
                    "Bairro Centro",
                    style: Theme.of(context).accentTextTheme.body1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                  child: Text(
                    "Gravataí/RS – CEP 94035-240",
                    style: Theme.of(context).accentTextTheme.body1,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * .25),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.75,
            padding: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                )),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Observer(
                      builder: (BuildContext context) {
                        return (controller.errorText == null ||
                                controller.errorText.isEmpty)
                            ? Text(
                                "Entre em contato",
                                style: Theme.of(context).primaryTextTheme.body1,
                              )
                            : Text(
                                controller.errorText,
                                style: Theme.of(context).primaryTextTheme.body1,
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
                        color: Theme.of(context).cardColor,
                      ),
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 150,
                      child: TextField(
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
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
                        onPressed: () => controller.sendEmail()),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
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
