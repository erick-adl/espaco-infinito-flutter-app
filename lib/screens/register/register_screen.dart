import 'package:flutter/material.dart';
import 'package:infinito/screens/register/constants.dart';
import 'package:infinito/screens/register/default_title.dart';
import 'package:infinito/screens/register/device_config.dart';
import 'package:infinito/screens/register/footer.dart';
import 'package:infinito/screens/register/sign_in_form.dart';
import 'package:infinito/screens/register/sign_up_form.dart';

class RegisterScreen extends StatelessWidget {
  static String routeID = "REGISTER_SCREEN";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        body: Container(
          color: Theme.of(context).primaryColor,
          child: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const DefaultTitle(),
                  Expanded(
                    child: Stack(
                      children: <Widget>[
                        const WhiteFooter(),
                        Tabs(scaffoldContext: _scaffoldKey.currentContext),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Tabs extends StatelessWidget {
  const Tabs({
    Key key,
    @required this.scaffoldContext,
  }) : super(key: key);
  final BuildContext scaffoldContext;
  @override
  Widget build(BuildContext context) {
    DeviceData deviceData = DeviceData.init(context);
    return DefaultTabController(
      length: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: deviceData.screenHeight * 0.1,
            child: TabBar(
              onTap: (x) => FocusScope.of(context).unfocus(),
              tabs: [Tab(text: 'Entrar'), Tab(text: 'Cadastre-se')],
              labelStyle: kArialFontStyle.copyWith(
                fontSize: deviceData.screenHeight * 0.018,
              ),
              labelColor: Theme.of(context).primaryColor,
              unselectedLabelColor: Colors.black38,
              indicatorColor: Colors.transparent,
            ),
          ),
          Expanded(
            child: TabBarView(children: [
              SignInForm(scaffoldContext: scaffoldContext),
              SignUpForm()
            ]),
          ),
        ],
      ),
    );
  }
}
