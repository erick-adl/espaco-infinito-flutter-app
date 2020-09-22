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
  String urlTextWhats1 =
      "https://api.whatsapp.com/send?phone=5551989071829&text=Ol%C3%A1!%20Gostaria%20de%20mais%20informacões";
  String urlTextWhats2 =
      "https://api.whatsapp.com/send?phone=5551991928250&text=Ol%C3%A1!%20Gostaria%20de%20mais%20informacões";
  @override
  Widget build(BuildContext context) {
    final screenSizeHeight = MediaQuery.of(context).size.height;
    final theme = Theme.of(context);

    return Container(
      color: theme.primaryColor,
      height: screenSizeHeight,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            buildContainerInfos(context),
            Container(
                height: screenSizeHeight * 0.7,
                decoration: BoxDecoration(
                    color: theme.backgroundColor,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(50))),
                child: buildContainerSendMessage(context)),
          ],
        ),
      ),
    );
  }

  Container buildContent(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            buildContainerInfos(context),
            buildContainerSendMessage(context),
          ],
        ),
      ),
    );
  }

  buildContainerSendMessage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Container(
        padding: const EdgeInsets.only(bottom: 20),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(30), bottom: Radius.circular(30))),
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
                        style: Theme.of(context).primaryTextTheme.bodyText2,
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
    );
  }

  buildContainerInfos(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
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
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
              child: Text(
                "Entre em contato:",
                style: Theme.of(context).accentTextTheme.subtitle2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
              child: GestureDetector(
                onTap: () => UrlLauch.launchInBrowser(urlTextWhats1),
                child: Text(
                  "051 989071-829",
                  style: Theme.of(context).accentTextTheme.bodyText2,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
              child: GestureDetector(
                onTap: () => UrlLauch.launchInBrowser(urlTextWhats2),
                child: Text(
                  "051 99192-8250",
                  style: Theme.of(context).accentTextTheme.bodyText2,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
