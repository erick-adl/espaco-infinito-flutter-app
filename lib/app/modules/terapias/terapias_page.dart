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
    final screenSizeWidth = MediaQuery.of(context).size.width;
    final screenSizeHeight = MediaQuery.of(context).size.height;
    final theme = Theme.of(context);

    return Container(
        height: screenSizeHeight,
        color: theme.backgroundColor,
        child: Stack(
          children: <Widget>[
            Container(
              color: theme.primaryColor,
              height: screenSizeHeight / 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(15),
                    height: 60,
                    decoration: BoxDecoration(
                        color: theme.textSelectionColor,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
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
                            color: Colors.black,
                            size: 22.0,
                          ),
                          hintText: "Busque...",
                          hintStyle: TextStyle(
                              fontFamily: "WorkSansSemiBold", fontSize: 17.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 60),
              child: Container(
                padding: EdgeInsets.only(top: 30),
                color: Colors.transparent,
                width: screenSizeWidth,
                child: StreamBuilder<QuerySnapshot>(
                  stream: Firestore.instance
                      .collection('terapias')
                      .where('nome',
                          isGreaterThanOrEqualTo:
                              toBeginningOfSentenceCase(searchKey))
                      .where('nome',
                          isLessThan:
                              toBeginningOfSentenceCase(searchKey) + "z")
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
            )
          ],
        ));
  }
}
