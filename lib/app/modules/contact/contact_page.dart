import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinito/app/modules/contact/contact_controller.dart';
import 'package:infinito/app/shared/utils/url_lauch.dart';

import 'package:infinito/app/shared/widgets/custom_button.widget.dart';
import 'package:infinito/app/shared/widgets/custom_textfield.widget.dart';

class ContactPage extends StatefulWidget {
  final String title;
  const ContactPage({Key key, this.title = "Contato"}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends ModularState<ContactPage, ContactController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 20,
            child: Container(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width,
              child: InkWell(
                onTap: () => UrlLauch.launchInBrowser(
                    "https://www.google.com/maps/place/Espa%C3%A7o+infinito+-+Terapias+Alternativas+E+Produtos+Hol%C3%ADsticos/@-29.9514781,-50.9957021,15z/data=!4m5!3m4!1s0x0:0xbaf2539391a38a9c!8m2!3d-29.9514781!4d-50.9957021"),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                      child: Text(
                        "Nosso endereço fica na Av. José Loureiro da Silva n° 1799",
                        style: Theme.of(context).accentTextTheme.bodyText2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                      child: Text(
                        "Bairro Centro",
                        style: Theme.of(context).accentTextTheme.bodyText2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                      child: Text(
                        "Gravataí/RS – CEP 94035-240",
                        style: Theme.of(context).accentTextTheme.bodyText2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: (MediaQuery.of(context).size.height / 4),
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
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
                      child: Observer(builder: (context) {
                        return controller.errorText != null
                            ? Text(
                                controller.errorText,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "Inter",
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : Text(
                                "Entre em contato",
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyText2,
                              );
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: CustomTextFieldWidget(
                          context: context,
                          textHint: "Nome",
                          iconDecoration: null,
                          onChanged: (value) => controller.nome = value,
                          obscureText: false,
                          textInputType: TextInputType.text),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: CustomTextFieldWidget(
                          context: context,
                          textHint: "E-mail",
                          iconDecoration: null,
                          onChanged: (value) => controller.email = value,
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
                          color: Theme.of(context).dividerColor,
                        ),
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 150,
                        child: TextField(
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          obscureText: false,
                          onChanged: (value) => controller.message = value,
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
                        onPressed: () => controller.sendEmail(),
                        milked: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
