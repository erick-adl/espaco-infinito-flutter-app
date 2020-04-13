import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinito/app/shared/widgets/custom_button.widget.dart';
import 'package:infinito/app/shared/widgets/custom_scaffold.dart';
import 'package:infinito/app/shared/widgets/custon_drawer_menu_widget.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Quem somos"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController>
    with SingleTickerProviderStateMixin {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      page: pageHome(),
      title: widget.title,
    );
  }

  Widget pageHome() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 1.2,
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Image(
              image: AssetImage('assets/images/logo_infinito.png'),
              height: 150,
              width: 150,
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Infinite-se",
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.display4,
              )),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Text(
                  "Aqui você vai encontrar tudo sobre o nosso espaço. Um lugar diferenciado para pessoas que querem O MELHOR DE SUAS VIDAS. Desde o iníco nos propusemos a construir um lugar que se tornasse referência, tanto no aspecto dos atendimentos terapêuticos, na oferta e comercialização de produtos do mundo holístico, quanto na implementação de atividades formativas, realizando cursos, palestras e workshops",
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.display1,
                ),
              )),
          CustomButton(
              context: context,
              text: "Conheça nossas terapias",
              onPressed: () => Modular.to.pushReplacementNamed("/home")),
        ],
      ),
    );
  }
}
