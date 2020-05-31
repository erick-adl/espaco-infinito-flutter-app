import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:infinito/app/shared/widgets/custom_button.widget.dart';

class AboutPage extends StatelessWidget {
  final String title;
  const AboutPage({Key key, this.title = "Quem somos"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: SingleChildScrollView(
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
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Text(
                    "Aqui você vai encontrar tudo sobre o nosso espaço. Um lugar diferenciado para pessoas que querem O MELHOR DE SUAS VIDAS. Desde o iníco nos propusemos a construir um lugar que se tornasse referência, tanto no aspecto dos atendimentos terapêuticos, na oferta e comercialização de produtos do mundo holístico, quanto na implementação de atividades formativas, realizando cursos, palestras e workshops",
                    style: Theme.of(context).accentTextTheme.body1,
                    textAlign: TextAlign.justify,
                  ),
                )),
            CustomButton(
                context: context,
                text: "Conheça nossas terapias",
                onPressed: () => Modular.to.pushReplacementNamed("/about")),
          ],
        ),
      ),
    );
  }
}
