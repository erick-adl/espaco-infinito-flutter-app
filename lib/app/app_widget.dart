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
          primaryColorBrightness: Brightness.dark,
          primaryColor: Color(0xFFe0a650),
          primaryColorLight: Color(0xFFe0a650),
          primaryColorDark: Color(0xFFe0a650),
          backgroundColor: Color(0xFFFFFFFF),
          buttonColor: Color(0xFFe0a650),
          buttonTheme: ButtonThemeData(
            buttonColor: Color(0xFFf5f5f5),
          ),
          iconTheme: IconThemeData(color: Color(0xFFe0a650)),
          accentIconTheme: IconThemeData(color: Colors.black54),
          primaryIconTheme: IconThemeData(color: Color(0xFFe0a650)),
          cardColor: Color(0xFFf5f5f5),
          fontFamily: 'Inter',
          primaryTextTheme: TextTheme(
              headline: TextStyle(
                  fontSize: 36,
                  fontFamily: "Inter",
                  color: Colors.black54,
                  fontWeight: FontWeight.bold),
              subhead: TextStyle(
                  fontSize: 30,
                  fontFamily: "Inter",
                  color: Colors.black54,
                  fontWeight: FontWeight.bold),
              title: TextStyle(
                  fontSize: 24,
                  fontFamily: "Inter",
                  color: Colors.black54,
                  fontWeight: FontWeight.bold),
              subtitle: TextStyle(
                  fontSize: 20,
                  fontFamily: "Inter",
                  color: Colors.black54,
                  fontWeight: FontWeight.bold),
              body1: TextStyle(
                fontSize: 18,
                fontFamily: "Inter",
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
              body2: TextStyle(
                fontSize: 15,
                fontFamily: "Inter",
                color: Colors.black54,
              ),
              button: TextStyle(
                  fontSize: 18,
                  fontFamily: "Inter",
                  color: Colors.black54,
                  fontWeight: FontWeight.bold)),
          accentTextTheme: TextTheme(
              headline: TextStyle(
                  fontSize: 36,
                  fontFamily: "Inter",
                  color: Color(0xFFf3f3f4),
                  fontWeight: FontWeight.bold),
              subhead: TextStyle(
                  fontSize: 30,
                  fontFamily: "Inter",
                  color: Color(0xFFf3f3f4),
                  fontWeight: FontWeight.bold),
              title: TextStyle(
                  fontSize: 24,
                  fontFamily: "Inter",
                  color: Color(0xFFf3f3f4),
                  fontWeight: FontWeight.bold),
              subtitle: TextStyle(
                  fontSize: 20,
                  fontFamily: "Inter",
                  color: Color(0xFFf3f3f4),
                  fontWeight: FontWeight.bold),
              body1: TextStyle(
                  fontSize: 18,
                  fontFamily: "Inter",
                  color: Color(0xFFf3f3f4),
                  fontWeight: FontWeight.bold),
              body2: TextStyle(
                fontSize: 15,
                fontFamily: "Inter",
                color: Color(0xFFf3f3f4),
              ),
              button: TextStyle(
                  fontSize: 18,
                  fontFamily: "Inter",
                  color: Color(0xFFf3f3f4),
                  fontWeight: FontWeight.bold)),
        ));
  }
}
