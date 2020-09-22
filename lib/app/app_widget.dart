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
          primarySwatch: Colors.orange,
          primaryColorBrightness: Brightness.light,
          accentColor: Color(0xFFffa726),
          primaryColor: Color(0xFFffa726),
          primaryColorLight: Color(0xFFffa726),
          primaryColorDark: Color(0xFFffa726),
          dividerColor: Color(0xFFebebeb),
          backgroundColor: Color(0xFFFFFFFF),
          buttonColor: Color(0xFFffa726),
          iconTheme: IconThemeData(color: Color(0xFFFFFFFF)),
          accentIconTheme: IconThemeData(color: Color(0xFF23185f)),
          primaryIconTheme: IconThemeData(color: Color(0xFF23185f)),
          primaryTextTheme: TextTheme(
              headline5: TextStyle(
                  fontSize: 36,
                  fontFamily: "Inter",
                  color: Color(0xFF23185f),
                  fontWeight: FontWeight.bold),
              subtitle1: TextStyle(
                  fontSize: 30,
                  fontFamily: "Inter",
                  color: Color(0xFF23185f),
                  fontWeight: FontWeight.bold),
              headline6: TextStyle(
                  fontSize: 24,
                  fontFamily: "Inter",
                  color: Color(0xFF23185f),
                  fontWeight: FontWeight.bold),
              subtitle2: TextStyle(
                  fontSize: 20,
                  fontFamily: "Inter",
                  color: Color(0xFF23185f),
                  fontWeight: FontWeight.bold),
              bodyText2: TextStyle(
                fontSize: 18,
                fontFamily: "Inter",
                color: Color(0xFF23185f),
                fontWeight: FontWeight.bold,
              ),
              bodyText1: TextStyle(
                fontSize: 15,
                fontFamily: "Inter",
                color: Color(0xFF23185f),
                fontWeight: FontWeight.bold,
              ),
              button: TextStyle(
                  fontSize: 18,
                  fontFamily: "Inter",
                  color: Color(0xFF23185f),
                  fontWeight: FontWeight.bold)),
          accentTextTheme: TextTheme(
              headline5: TextStyle(
                  fontSize: 36,
                  fontFamily: "Inter",
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.bold),
              subtitle1: TextStyle(
                  fontSize: 30,
                  fontFamily: "Inter",
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.bold),
              headline6: TextStyle(
                  fontSize: 24,
                  fontFamily: "Inter",
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.bold),
              subtitle2: TextStyle(
                  fontSize: 20,
                  fontFamily: "Inter",
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.bold),
              bodyText2: TextStyle(
                  fontSize: 18,
                  fontFamily: "Inter",
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.bold),
              bodyText1: TextStyle(
                fontSize: 15,
                fontFamily: "Inter",
                color: Color(0xFFFFFFFF),
              ),
              button: TextStyle(
                  fontSize: 18,
                  fontFamily: "Inter",
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.bold)),
        ));
  }
}
