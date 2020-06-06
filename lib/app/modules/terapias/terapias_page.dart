import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infinito/app/modules/terapias/terapias_controller.dart';
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

class _TerapiasPageState extends ModularState<TerapiasPage, TerapiasController>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollController = new ScrollController();

  void _setScrollControl() async {
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
              ScrollDirection.forward &&
          !controller.searchBarShow) {
        controller.searchBarShow = true;
      }

      if (_scrollController.position.userScrollDirection ==
              ScrollDirection.reverse &&
          controller.searchBarShow) {
        controller.searchBarShow = false;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _setScrollControl();
  }

  @override
  void dispose() {
    _scrollController.removeListener(() {});
    super.dispose();
  }

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
              color: theme.backgroundColor,
              width: screenSizeWidth,
              child: Observer(builder: (_) {
                return StreamBuilder<QuerySnapshot>(
                  stream: Firestore.instance
                      .collection('terapias')
                      .where('nome',
                          isGreaterThanOrEqualTo:
                              toBeginningOfSentenceCase(controller.searchKey))
                      .where('nome',
                          isLessThan:
                              toBeginningOfSentenceCase(controller.searchKey) +
                                  "z")
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
                          controller: _scrollController,
                          children: snapshot.data.documents
                              .map((DocumentSnapshot document) {
                            return new TerapiasTileWidget(
                              document: document,
                            );
                          }).toList(),
                        );
                    }
                  },
                );
              }),
            ),
            Observer(builder: (_) {
              return AnimatedOpacity(
                  duration: Duration(milliseconds: 500),
                  opacity: controller.searchBarShow ? 1 : 0,
                  child: controller.searchBarShow
                      ? Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            height: 50,
                            decoration: BoxDecoration(
                                color: theme.textSelectionColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: TextField(
                                onChanged: (value) =>
                                    controller.searchKey = value,
                                keyboardType: TextInputType.text,
                                style: TextStyle(
                                    fontFamily: "WorkSansSemiBold",
                                    fontSize: 16.0,
                                    color: Colors.black),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(
                                    FontAwesomeIcons.search,
                                    color: theme.primaryColor,
                                    size: 22.0,
                                  ),
                                  // hintText: "Busque...",
                                  hintStyle: TextStyle(
                                      fontFamily: "WorkSansSemiBold",
                                      fontSize: 17.0),
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container());
            }),
          ],
        ));
  }
}
