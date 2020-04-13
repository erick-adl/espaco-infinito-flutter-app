import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: Modular.navigatorKey,
        title: 'Espaço Infinito',
        initialRoute: Modular.initialRoute,
        onGenerateRoute: Modular.generateRoute,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // Define the default brightness and colors.
          brightness: Brightness.light,
          primaryColor: Color(0xFFf9a933),
          secondaryHeaderColor: Color(0xFFde9426),

          accentColor: Color(0xfff3f5f6),
          unselectedWidgetColor: Color(0xff2f4049),

          // Define the default font family.
          // fontFamily: 'Georgia',

          // Define the default TextTheme. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
          textTheme: TextTheme(
              button: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'WorkSansBold',
                  color: Color(0xff2f4049)),
              title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
              body1: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'WorkSansBold',
                  color: Color(0xff2f4049)),
              headline: TextStyle(
                  fontSize: 12.0,
                  fontFamily: 'WorkSansBold',
                  color: Color(0xff2f4049)),
              subhead: TextStyle(
                  fontSize: 12.0,
                  fontFamily: 'WorkSansBold',
                  color: Color(0xff2f4049)),
              body2: TextStyle(
                  fontSize: 15.0,
                  fontFamily: 'WorkSansBold',
                  color: Color(0xfff3f5f6)),
              display3: TextStyle(
                  fontSize: 15.0,
                  fontFamily: 'WorkSansBold',
                  color: Color(0xff2f4049)),
              display2: TextStyle(
                  fontSize: 15.0,
                  fontFamily: 'WorkSansBold',
                  color: Color(0xfff3f5f6)),
              display1: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'WorkSansBold',
                  color: Color(0xfff3f5f6)),
              display4: TextStyle(
                  fontSize: 23.0,
                  fontFamily: 'WorkSansBold',
                  color: Color(0xfff3f5f6))),
        ));
  }
}
