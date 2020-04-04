import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:infinito/app/modules/terapias/terapias_tile_widget.dart';

import 'package:infinito/app/shared/widgets/color_loader.dart';
import 'package:infinito/app/shared/widgets/custom_scaffold.dart';
import 'package:infinito/app/shared/widgets/custon_drawer_menu_widget.dart';
import 'terapias_controller.dart';

class TerapiasPage extends StatefulWidget {
  final String title;
  const TerapiasPage({Key key, this.title = "Terapias"}) : super(key: key);

  @override
  _TerapiasPageState createState() => _TerapiasPageState();
}

class _TerapiasPageState
    extends ModularState<TerapiasPage, TerapiasController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      menu: CustonDrawerMenuWidget(),
      title: widget.title,
      page: buildTerapiasPage(),
    );
  }

  buildTerapiasPage() {
    return Container(
      height: MediaQuery.of(context).size.height / 1.15,
      width: MediaQuery.of(context).size.width,
      child: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('terapias').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: new ColorLoader());
            default:
              return new ListView(
                children:
                    snapshot.data.documents.map((DocumentSnapshot document) {
                  return new TerapiasTileWidget(
                    document: document,
                  );
                }).toList(),
              );
          }
        },
      ),
    );
  }
}
