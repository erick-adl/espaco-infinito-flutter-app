import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinito/app/modules/login/login_controller.dart';

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
            LoginBannerWidget(context: context),
            CustomFormWidget(
              context: context,
              children: <Widget>[
                CustomTextFieldWidget(
                    context: context,
                    textHint: "Email",
                    iconDecoration: Icon(Icons.email)),
                CustomTextFieldWidget(
                    context: context,
                    textHint: "Senha",
                    iconDecoration: Icon(Icons.vpn_key)),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 20, right: 8, bottom: 30),
                    child: Text(
                      "Esqueceu a senha?",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
                CustomButton(context: context, text: "Entrar"),
                CustomButton(
                    context: context, text: "Entre com sua conta Google"),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 5, right: 8, bottom: 30),
                    child: Text(
                      "Não tem uma conta? Cadastre-se",
                      style: TextStyle(color: Theme.of(context).primaryColor),
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

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key key,
    @required this.text,
    this.context,
  }) : super(key: key);

  final BuildContext context;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width / 1.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xfff45d27), Color(0xfff5851f)]),
        ),
        child: Center(
          child: Text(
            this.text.toUpperCase(),
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class CustomFormWidget extends StatelessWidget {
  const CustomFormWidget({
    Key key,
    @required this.context,
    @required this.children,
  }) : super(key: key);

  final BuildContext context;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 50),
      child: Column(children: children),
    );
  }
}

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget(
      {Key key,
      @required this.context,
      @required this.textHint,
      @required this.iconDecoration})
      : super(key: key);

  final String textHint;
  final BuildContext context;
  final Icon iconDecoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 4, 16, 5),
      margin: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
      width: MediaQuery.of(context).size.width / 1.2,
      height: 50,
      child: TextField(
        decoration: InputDecoration(
            hintText: textHint, icon: iconDecoration, border: InputBorder.none),
      ),
    );
  }
}

class LoginBannerWidget extends StatelessWidget {
  const LoginBannerWidget({
    Key key,
    @required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xfff45d27), Color(0xfff5851f)]),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Image(
                image: AssetImage('assets/images/logo_infinito.png'),
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              )),
        ],
      ),
    );
  }
}
