import 'package:flutter/material.dart';
import 'package:infinito/common/widgets/color_loader.dart';
import 'package:infinito/helpers/validators.dart';
import 'package:infinito/models/user.dart';
import 'package:infinito/models/user_manager.dart';
import 'package:infinito/screens/register/button_widget.dart';
import 'package:infinito/screens/register/device_config.dart';
import 'package:infinito/screens/register/input_field.dart';
import 'package:provider/provider.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    Key key,
    @required this.scaffoldContext,
  }) : super(key: key);
  final BuildContext scaffoldContext;

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm>
    with AutomaticKeepAliveClientMixin {
  final _formKey = GlobalKey<FormState>();
  String email, password;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final deviceData = DeviceData.init(context);
    return Consumer<UserManager>(builder: (_, userManager, __) {
      return Stack(
        children: [
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.only(
                  left: deviceData.screenWidth * 0.11,
                  right: deviceData.screenWidth * 0.11,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: deviceData.screenHeight * 0.04),
                    InputField(
                      // errorText:
                      //     failure is EmailException ? failure.code : null,
                      onValidator: (email) {
                        if (!emailValid(email)) return 'E-mail inválido';
                        return null;
                      },
                      inputTitle: "E-mail",
                      hintText: "Entre com seu email de registro",
                      inputType: TextInputType.emailAddress,
                      controller: emailController,
                    ),
                    SizedBox(height: deviceData.screenHeight * 0.03),
                    InputField(
                      inputTitle: "Senha",
                      hintText: "Entre com sua senha",
                      // errorText:
                      //     failure is PasswordException ? failure.code : null,
                      onValidator: (pass) {
                        if (pass.isEmpty || pass.length < 6)
                          return 'Senha inválida';
                        return null;
                      },
                      obscureText: true,
                      isLastField: true,
                      controller: passController,
                    ),
                    SizedBox(height: deviceData.screenHeight * 0.04),
                    RoundedButton(
                        text: "Entrar",
                        onPressed: userManager.loading
                            ? null
                            : () {
                                FocusScope.of(context).unfocus();
                                if (_formKey.currentState.validate()) {
                                  userManager.signIn(
                                      user: User(
                                          email: emailController.text,
                                          password: passController.text),
                                      onFail: (e) {
                                        scaffoldKey.currentState
                                            .showSnackBar(SnackBar(
                                          content: Text('Falha ao entrar: $e'),
                                          backgroundColor: Colors.red,
                                        ));
                                      },
                                      onSuccess: () {
                                        Navigator.of(context).pop();
                                      });
                                }
                              })
                  ],
                ),
              ),
            ),
          ),
          userManager.loading
              ? Padding(
                  padding:
                      EdgeInsets.only(bottom: deviceData.screenHeight * 0.3),
                  child: Center(child: ColorLoader()),
                )
              : Container()
        ],
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
