import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinito/app/shared/widgets/color_loader.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            LoginBannerWidget(context: context, bannerText: "Cadastro"),
            Observer(
              builder: (BuildContext context) {
                return controller.successText.isEmpty
                    ? CustomFormWidget(
                        context: context,
                        children: <Widget>[
                          Align(
                              alignment: Alignment.center,
                              child: Observer(
                                builder: (BuildContext context) {
                                  return Text(
                                    controller.errorText,
                                    style: TextStyle(color: Colors.red),
                                  );
                                },
                              )),
                          CustomTextFieldWidget(
                            context: context,
                            textHint: "Nome completo",
                            iconDecoration: Icon(Icons.account_box),
                            onChanged: controller.changeName,
                            obscureText: false,
                            textInputType: TextInputType.text,
                          ),
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
                          CustomTextFieldWidget(
                            context: context,
                            textHint: "Confirmar senha",
                            iconDecoration: Icon(Icons.vpn_key),
                            onChanged: controller.changePasswordCheck,
                            obscureText: true,
                            textInputType: TextInputType.text,
                          ),
                          Observer(
                            builder: (BuildContext context) {
                              return controller.loading == true
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ColorLoader(),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: CustomButton(
                                          context: context,
                                          text: "Cadastrar",
                                          fun: controller.isValidForm),
                                    );
                            },
                          )
                        ],
                      )
                    : Observer(
                        builder: (BuildContext context) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 40.0),
                            child: Text(
                              controller.successText,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Theme.of(context).primaryColor),
                            ),
                          );
                        },
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
