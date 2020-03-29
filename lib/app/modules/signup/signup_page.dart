import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinito/app/shared/widgets/custom_button.widget.dart';
import 'package:infinito/app/shared/widgets/custom_form.widget.dart';
import 'package:infinito/app/shared/widgets/custom_textfield.widget.dart';
import 'package:infinito/app/shared/widgets/login_banner.widget.dart';
import 'signup_controller.dart';

class SignupPage extends StatefulWidget {
  final String title;
  const SignupPage({Key key, this.title = "Signup"}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends ModularState<SignupPage, SignupController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            LoginBannerWidget(context: context, bannerText: "Cadastro"),
            CustomFormWidget(
              context: context,
              children: <Widget>[
                CustomTextFieldWidget(
                    context: context,
                    textHint: "Nome completo",
                    iconDecoration: Icon(Icons.account_box)),
                CustomTextFieldWidget(
                    context: context,
                    textHint: "Email",
                    iconDecoration: Icon(Icons.email)),
                CustomTextFieldWidget(
                    context: context,
                    textHint: "Senha",
                    iconDecoration: Icon(Icons.vpn_key)),
                CustomTextFieldWidget(
                    context: context,
                    textHint: "Confirmar senha",
                    iconDecoration: Icon(Icons.vpn_key)),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: CustomButton(context: context, text: "Cadastrar"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
