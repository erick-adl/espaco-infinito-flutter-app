import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:infinito/app/modules/contact/contact_controller.dart';
import 'package:infinito/app/shared/utils/url_lauch.dart';
import 'package:infinito/app/shared/utils/url_utils.dart';

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
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          buildContainerInfos(context),
          buildContainerSendMessage(context),
        ],
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
            color: Theme.of(context).dividerColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Obx(() => Visibility(
                      visible: controller.errorText.value != null,
                      child: Text(
                        controller.errorText.value,
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Inter",
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      replacement: Text(
                        "Entre em contato",
                        style: Theme.of(context).primaryTextTheme.bodyText2,
                      ),
                    ))),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: CustomTextFieldWidget(
                  context: context,
                  textHint: "Nome",
                  iconDecoration: null,
                  onChanged: (value) => controller.nome.value = value,
                  obscureText: false,
                  textInputType: TextInputType.text),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: CustomTextFieldWidget(
                  context: context,
                  textHint: "E-mail",
                  iconDecoration: null,
                  onChanged: (value) => controller.email.value = value,
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
                ),
                width: MediaQuery.of(context).size.width / 1.2,
                height: 150,
                child: TextField(
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  obscureText: false,
                  onChanged: (value) => controller.message.value = value,
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
        onTap: () => UrlLauch.launchInBrowser(googleLocationMap),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: Text(
                "Nosso endereço fica na Av. José Loureiro da Silva n° 1799",
                style: Theme.of(context)
                    .primaryTextTheme
                    .bodyText2
                    .copyWith(fontWeight: FontWeight.normal),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
              child: Text(
                "Bairro Centro",
                style: Theme.of(context)
                    .primaryTextTheme
                    .bodyText2
                    .copyWith(fontWeight: FontWeight.normal),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
              child: Text(
                "Gravataí/RS – CEP 94035-240",
                style: Theme.of(context)
                    .primaryTextTheme
                    .bodyText2
                    .copyWith(fontWeight: FontWeight.normal),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
              child: Text(
                "Entre em contato:",
                style: Theme.of(context)
                    .primaryTextTheme
                    .subtitle2
                    .copyWith(fontWeight: FontWeight.normal),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
              child: GestureDetector(
                onTap: () => UrlLauch.launchInBrowser(whatsAppUrlTextContact1),
                child: Text("051 989071-829",
                    style: Theme.of(context)
                        .primaryTextTheme
                        .bodyText2
                        .copyWith(fontWeight: FontWeight.normal)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
              child: GestureDetector(
                onTap: () => UrlLauch.launchInBrowser(whatsAppUrlTextContact2),
                child: Text(
                  "051 99192-8250",
                  style: Theme.of(context)
                      .primaryTextTheme
                      .bodyText2
                      .copyWith(fontWeight: FontWeight.normal),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
