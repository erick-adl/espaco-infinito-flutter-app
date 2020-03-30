import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinito/app/modules/login/login_controller.dart';
import 'package:infinito/app/shared/widgets/color_loader.dart';
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
            Observer(
              builder: (BuildContext context) {
                return controller.loading == false
                    ? CustomFormWidget(
                        context: context,
                        children: <Widget>[
                          Align(
                              alignment: Alignment.center,
                              child: Observer(
                                builder: (BuildContext context) {
                                  return (controller.errorText == null ||
                                          controller.errorText.isEmpty)
                                      ? Text(
                                          "Favor, preencha as informacãoes de login",
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor),
                                        )
                                      : Text(
                                          controller.errorText,
                                          style: TextStyle(color: Colors.red),
                                        );
                                },
                              )),
                          CustomTextFieldWidget(
                            context: context,
                            textHint: "Email",
                            iconDecoration: Icon(Icons.email),
                            onChanged: controller.changeEmail,
                            obscureText: false,
                            textInputType: TextInputType.emailAddress,
                          ),
                          CustomTextFieldWidget(
                            context: context,
                            textHint: "Senha",
                            iconDecoration: Icon(Icons.vpn_key),
                            onChanged: controller.changePassword,
                            obscureText: true,
                            textInputType: TextInputType.text,
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, right: 40, bottom: 30),
                              child: GestureDetector(
                                onTap: () {
                                  Modular.to.pushNamed('/forgot/');
                                },
                                child: Text(
                                  "Esqueceu a senha?",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor),
                                ),
                              ),
                            ),
                          ),
                          Observer(builder: (BuildContext context) {
                            return CustomButton(
                                context: context,
                                text: "Entrar",
                                fun: controller.formCheck);
                          }),
                          Observer(
                            builder: (BuildContext context) {
                              return CustomButton(
                                  context: context,
                                  text: "Entre com sua conta Google",
                                  fun: controller.loginWithGoogle);
                            },
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 5, right: 8, bottom: 30),
                              child: GestureDetector(
                                onTap: () {
                                  Modular.to.pushNamed('/signup/');
                                },
                                child: Text(
                                  "Não tem uma conta? Cadastre-se",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Container(
                        padding: EdgeInsets.only(top: 80),
                        child: ColorLoader());
              },
            ),
          ],
        ),
      ),
    );
  }
}
