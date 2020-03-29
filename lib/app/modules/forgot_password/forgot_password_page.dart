import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinito/app/shared/widgets/custom_button.widget.dart';
import 'package:infinito/app/shared/widgets/custom_form.widget.dart';
import 'package:infinito/app/shared/widgets/custom_textfield.widget.dart';
import 'package:infinito/app/shared/widgets/login_banner.widget.dart';
import 'forgot_password_controller.dart';

class ForgotPasswordPage extends StatefulWidget {
  final String title;
  const ForgotPasswordPage({Key key, this.title = "ForgotPassword"})
      : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState
    extends ModularState<ForgotPasswordPage, ForgotPasswordController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            LoginBannerWidget(context: context, bannerText: "Recuperar senha"),
            CustomFormWidget(
              context: context,
              children: <Widget>[
                CustomTextFieldWidget(
                    context: context,
                    textHint: "Email",
                    iconDecoration: Icon(Icons.email)),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: CustomButton(context: context, text: "Recuperar"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
