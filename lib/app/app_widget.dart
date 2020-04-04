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
          primaryColor: Color(0xFF343442),
          secondaryHeaderColor: Color(0xFF30313e),

          accentColor: Color(0xfff5f8ff),
          unselectedWidgetColor: Color(0xff7f8193),

          // Define the default font family.
          // fontFamily: 'Georgia',

          // Define the default TextTheme. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
          textTheme: TextTheme(
            headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          ),
        ));
  }
}
