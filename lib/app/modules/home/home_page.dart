import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinito/app/modules/home/home_detail_product_page.dart';
import 'package:infinito/app/modules/home/home_detail_terapia_page.dart';

import 'package:infinito/app/modules/menudashboard/menudashboard_controller.dart';

import 'package:infinito/app/shared/widgets/color_loader.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'home_controller.dart';
import 'home_tile.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 20),
              child: Row(
                children: <Widget>[
                  Text("Solicitar mais ",
                      style: TextStyle(
                        fontSize: 18,
                        color: theme.primaryColor,
                        fontFamily: "Inter",
                      )),
                  Text("informações",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF23185f),
                          fontFamily: "Inter",
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 30),
              child: GestureDetector(
                onTap: () =>
                    Modular.get<MenudashboardController>().setTerapiasPage(),
                child: Text("Terapias",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF23185f),
                        fontFamily: "Inter",
                        fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 300,
              child: Observer(builder: (_) {
                return StreamBuilder<QuerySnapshot>(
                  stream: controller.getTerapiasFromFirestore(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError)
                      return new Text('Error: ${snapshot.error}');
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Center(child: new ColorLoader());
                      default:
                        return ScrollSnapList(
                          itemSize: 220,
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (context, index) {
                            return new HomeTileWidget(
                              document: snapshot.data.documents[index],
                              pageDetailBuild: HomeDetailTerapiaPage(
                                  document: snapshot.data.documents[index]),
                            );
                          },
                          initialIndex: 1,
                          onItemFocus: (i) {
                            print(i);
                          },
                          dynamicItemSize: true,
                        );
                    }
                  },
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 30),
              child: GestureDetector(
                onTap: () =>
                    Modular.get<MenudashboardController>().setProductsPage(),
                child: Text("Produtos",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF23185f),
                        fontFamily: "Inter",
                        fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 250,
              child: Observer(builder: (_) {
                return StreamBuilder<QuerySnapshot>(
                  stream: controller.getProductsFromFirestore(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError)
                      return new Text('Error: ${snapshot.error}');
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Center(child: new ColorLoader());
                      default:
                        return ScrollSnapList(
                          itemSize: 220,
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (context, index) {
                            return new HomeTileWidget(
                              document: snapshot.data.documents[index],
                              pageDetailBuild: HomeDetailProductPage(
                                  document: snapshot.data.documents[index]),
                            );
                          },
                          initialIndex: 1,
                          onItemFocus: (i) {
                            print(i);
                          },
                          dynamicItemSize: true,
                        );
                    }
                  },
                );
              }),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
