import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infinito/app/modules/terapias/terapias_tile_widget.dart';
import 'package:infinito/app/shared/widgets/color_loader.dart';
import 'package:infinito/app/shared/widgets/custom_scaffold.dart';
import 'terapias_controller.dart';
import 'package:intl/intl.dart';

class TerapiasPage extends StatefulWidget {
  final String title;
  const TerapiasPage({Key key, this.title = "Terapias"}) : super(key: key);

  @override
  _TerapiasPageState createState() => _TerapiasPageState();
}

class _TerapiasPageState
    extends ModularState<TerapiasPage, TerapiasController> {
  String searchKey = "";

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: widget.title,
      page: buildTerapiasPage(),
    );
  }

  buildTerapiasPage() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
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
                      // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //   crossAxisCount: 1,
                      //   childAspectRatio: 1.1,
                      // ),
                    );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
