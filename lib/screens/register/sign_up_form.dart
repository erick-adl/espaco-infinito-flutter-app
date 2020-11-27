import 'package:flutter/material.dart';
import 'package:infinito/common/widgets/color_loader.dart';
import 'package:infinito/helpers/validators.dart';
import 'package:infinito/models/user.dart';
import 'package:infinito/models/user_manager.dart';
import 'package:infinito/screens/register/button_widget.dart';
import 'package:infinito/screens/register/device_config.dart';
import 'package:infinito/screens/register/input_field.dart';
import 'package:provider/provider.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key key,
  }) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm>
    with AutomaticKeepAliveClientMixin {
  String username, email, password;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final User user = User();

  @override
  Widget build(BuildContext context) {
    super.build(context);

    DeviceData deviceData = DeviceData.init(context);

    return Consumer<UserManager>(builder: (context, userManager, __) {
      return Stack(
        children: [
          SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.only(
                  left: deviceData.screenWidth * 0.11,
                  right: deviceData.screenWidth * 0.11,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    InputField(
                      inputType: TextInputType.multiline,
                      textCapitalization: TextCapitalization.words,
                      inputTitle: "Nome completo",
                      hintText: "Nome completo",
                      onValidator: (name) {
                        if (name.isEmpty)
                          return 'Campo obrigatório';
                        else if (name.trim().split(' ').length <= 1)
                          return 'Preencha seu Nome completo';
                        return null;
                      },
                      onSaved: (name) => user.name = name,
                    ),
                    SizedBox(height: deviceData.screenHeight * 0.02),
                    InputField(
                      inputTitle: "Email",
                      inputType: TextInputType.emailAddress,
                      hintText: "Email",
                      onValidator: (email) {
                        if (email.isEmpty)
                          return 'Campo obrigatório';
                        else if (!emailValid(email)) return 'E-mail inválido';
                        return null;
                      },
                      onSaved: (email) => user.email = email,
                    ),
                    SizedBox(height: deviceData.screenHeight * 0.02),
                    InputField(
                      inputTitle: "Senha",
                      obscureText: true,
                      hintText: "Senha",
                      onValidator: (pass) {
                        if (pass.isEmpty)
                          return 'Campo obrigatório';
                        else if (pass.length < 6) return 'Senha muito curta';
                        return null;
                      },
                      onSaved: (pass) => user.password = pass,
                    ),
                    SizedBox(height: deviceData.screenHeight * 0.02),
                    InputField(
                      inputTitle: "Confirme a senha",
                      obscureText: true,
                      hintText: "Confirme a senha",
                      isLastField: true,
                      onValidator: (pass) {
                        if (pass.isEmpty)
                          return 'Campo obrigatório';
                        else if (pass.length < 6) return 'Senha muito curta';
                        return null;
                      },
                      onSaved: (pass) => user.confirmPassword = pass,
                    ),
                    SizedBox(height: deviceData.screenHeight * 0.03),
                    RoundedButton(
                      text: "Cadastre-se",
                      onPressed: userManager.loading
                          ? null
                          : () {
                              FocusScope.of(context).unfocus();
                              if (formKey.currentState.validate()) {
                                formKey.currentState.save();

                                if (user.password != user.confirmPassword) {
                                  scaffoldKey.currentState
                                      .showSnackBar(const SnackBar(
                                    content: Text('Senhas não coincidem!'),
                                    backgroundColor: Colors.red,
                                  ));
                                  return;
                                }

                                userManager.signUp(
                                    user: user,
                                    onSuccess: () {
                                      Navigator.of(context).pop();
                                    },
                                    onFail: (e) {
                                      scaffoldKey.currentState
                                          .showSnackBar(SnackBar(
                                        content: Text('Falha ao cadastrar: $e'),
                                        backgroundColor: Colors.red,
                                      ));
                                    });
                              }
                            },
                    )
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
  bool get wantKeepAlive => true;
}
