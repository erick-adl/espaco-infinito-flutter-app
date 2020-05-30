import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infinito/app/modules/terapias/terapias_tile_widget.dart';

import 'package:infinito/app/shared/widgets/color_loader.dart';

import 'package:intl/intl.dart';

class TerapiasPage extends StatefulWidget {
  final String title;
  final Function onMenuTap;

  const TerapiasPage({Key key, this.title = "Terapias", this.onMenuTap})
      : super(key: key);

  @override
  _TerapiasPageState createState() => _TerapiasPageState();
}

class _TerapiasPageState extends State<TerapiasPage> {
  String searchKey = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.15,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: (value) => {searchKey = value},
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                        fontFamily: "WorkSansSemiBold",
                        fontSize: 16.0,
                        color: Colors.black),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(
                        FontAwesomeIcons.search,
                        color: Theme.of(context).primaryColor,
                        size: 22.0,
                      ),
                      hintText: "Busque...",
                      hintStyle: TextStyle(
                          fontFamily: "WorkSansSemiBold", fontSize: 17.0),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 1.17,
              width: MediaQuery.of(context).size.width,
              child: StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance
                    .collection('terapias')
                    .where('nome',
                        isGreaterThanOrEqualTo:
                            toBeginningOfSentenceCase(searchKey))
                    .where('nome',
                        isLessThan: toBeginningOfSentenceCase(searchKey) + "z")
                    .orderBy("nome")
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError)
                    return new Text('Error: ${snapshot.error}');
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return Center(child: new ColorLoader());
                    default:
                      return new ListView(
                        // padding: EdgeInsets.all(),
                        children: snapshot.data.documents
                            .map((DocumentSnapshot document) {
                          return new TerapiasTileWidget(
                            document: document,
                          );
                        }).toList(),
                      );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
