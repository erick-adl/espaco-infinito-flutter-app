import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinito/app/modules/login/login_controller.dart';
import 'package:infinito/app/shared/widgets/custom_button.widget.dart';
import 'package:infinito/app/shared/widgets/custom_form.widget.dart';
import 'package:infinito/app/shared/widgets/custom_textfield.widget.dart';
import 'package:infinito/app/shared/widgets/login_banner.widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            LoginBannerWidget(
              context: context,
              bannerText: 'Login',
            ),
            CustomFormWidget(
              context: context,
              children: <Widget>[
                CustomTextFieldWidget(
                  context: context,
                  textHint: "Email",
                  iconDecoration: Icon(Icons.email),
                  onChanged: (_) {},
                  obscureText: false,
                  textInputType: TextInputType.emailAddress,
                ),
                CustomTextFieldWidget(
                  context: context,
                  textHint: "Senha",
                  iconDecoration: Icon(Icons.vpn_key),
                  onChanged: (_) {},
                  obscureText: true,
                  textInputType: TextInputType.text,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 20, right: 8, bottom: 30),
                    child: GestureDetector(
                      onTap: () {
                        Modular.to.pushNamed('/forgot/');
                      },
                      child: Text(
                        "Esqueceu a senha?",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                ),
                CustomButton(context: context, text: "Entrar", fun: () {}),
                CustomButton(
                    context: context,
                    text: "Entre com sua conta Google",
                    fun: () {}),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 5, right: 8, bottom: 30),
                    child: GestureDetector(
                      onTap: () {
                        Modular.to.pushNamed('/signup/');
                      },
                      child: Text(
                        "Não tem uma conta? Cadastre-se",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
