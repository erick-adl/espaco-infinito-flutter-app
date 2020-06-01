import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:infinito/app/shared/widgets/custom_button.widget.dart';

class AboutPage extends StatelessWidget {
  final String title;
  const AboutPage({Key key, this.title = "Quem somos"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSizeHeight = MediaQuery.of(context).size.height;
    final theme = Theme.of(context);

    return Container(
      color: theme.primaryColor,
      height: screenSizeHeight,
      child: Stack(
        children: <Widget>[
          Container(
            height: 150,
            child: Center(
              child: Image(
                image: AssetImage('assets/images/logo_infinito.png'),
                height: 150,
                width: 150,
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 140),
              child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: theme.backgroundColor,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(50))),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Text(
                          "Aqui você vai encontrar tudo sobre o nosso espaço. Um lugar diferenciado para pessoas que querem O MELHOR DE SUAS VIDAS. Desde o iníco nos propusemos a construir um lugar que se tornasse referência, tanto no aspecto dos atendimentos terapêuticos, na oferta e comercialização de produtos do mundo holístico, quanto na implementação de atividades formativas, realizando cursos, palestras e workshops",
                          style: theme.primaryTextTheme.body1,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      CustomButton(
                          milked: true,
                          context: context,
                          text: "Conheça nossas terapias",
                          onPressed: () =>
                              Modular.to.pushReplacementNamed("/about")),
                    ],
                  ))),
        ],
      ),
    );
  }
}
