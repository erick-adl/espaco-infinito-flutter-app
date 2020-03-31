import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinito/app/modules/drawer_menu/drawer_menu_widget.dart';
import 'package:infinito/app/shared/auth_firebase/auth_controller.dart';
import 'package:infinito/app/shared/widgets/custom_button.widget.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = ""}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  final _authController = Modular.get<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: DrawerMenuWidget(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xfff45d27), Color(0xfff5851f)]),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text(
                      "Seja muito bem vindo!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                    child: Text(
                      "Aqui você vai encontrar tudo sobre o nosso espaço. Um lugar deferenciado para pessoas que querem O MELHOR DE SUAS VIDAS. Desde o iníco nos propusemos a construir um lugar que se tornasse referência, tanto no aspecto dos atendimentos terapêuticos, na oferta e comercialização dee produtos do mundo holístico, quanto na implementação de atividades formativas, realizando cursos, palestras e workshops",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: Text(
                  "Aqui você vai encontrar tudo sobre o nosso espaço. Um lugar deferenciado para pessoas que querem O MELHOR DE SUAS VIDAS. Desde o iníco nos propusemos a construir um lugar que se tornasse referência, tanto no aspecto dos atendimentos terapêuticos, na oferta e comercialização dee produtos do mundo holístico, quanto na implementação de atividades formativas, realizando cursos, palestras e workshops",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              CustomButton(
                  text: "Conheça nossas terapias",
                  fun: () => Modular.to.pushReplacementNamed("/terapias")),
              CustomButton(text: "Conheça nossos produtos", fun: null),
              CustomButton(text: "Agende sua visita", fun: null),
            ],
          ),
        ),
      ),
    );
  }
}
