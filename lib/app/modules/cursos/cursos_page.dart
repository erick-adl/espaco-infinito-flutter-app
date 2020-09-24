import 'package:flutter/material.dart';

class CursosPage extends StatefulWidget {
  final String title;
  const CursosPage({Key key, this.title = "Cursos"}) : super(key: key);

  @override
  _CursosPageState createState() => _CursosPageState();
}

class _CursosPageState extends State<CursosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
