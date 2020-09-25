import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';

import 'package:get/get.dart';
import 'package:infinito/app/modules/custom_drawer/custom_drawer.dart';

import 'package:infinito/app/shared/widgets/color_loader.dart';

import 'cursos_controller.dart';
import 'cursos_tile_widget.dart';

class CursosPage extends StatefulWidget {
  final String title;
  final Function onMenuTap;

  const CursosPage({Key key, this.title = "Cursos", this.onMenuTap})
      : super(key: key);

  @override
  _CursosPageState createState() => _CursosPageState();
}

class _CursosPageState extends ModularState<CursosPage, CursosController> {
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  FSBStatus status;

  @override
  Widget build(BuildContext context) {
    final screenSizeWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(widget.title,
            style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontFamily: "Inter",
                fontWeight: FontWeight.bold)),
      ),
      body: FoldableSidebarBuilder(
          status: status,
          drawer: CustomDrawer(),
          screenContents: _buildCursosScreen(theme, screenSizeWidth)),
    );
  }

  Container _buildCursosScreen(ThemeData theme, double screenSizeWidth) {
    return Container(
      color: theme.backgroundColor,
      child: StreamBuilder<QuerySnapshot>(
        stream: controller.getCursosPalestrasFromFirestore(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: new ColorLoader());
            default:
              return Material(
                color: theme.backgroundColor,
                child: new ListView(
                  controller: _scrollController,
                  children:
                      snapshot.data.documents.map((DocumentSnapshot document) {
                    return new CursosTileWidget(
                      document: document,
                    );
                  }).toList(),
                ),
              );
          }
        },
      ),
    );
  }
}
