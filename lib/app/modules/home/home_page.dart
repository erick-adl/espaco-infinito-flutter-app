import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:infinito/app/modules/home/home_detail_product_page.dart';
import 'package:infinito/app/modules/home/home_detail_terapia_page.dart';
import 'package:infinito/app/modules/menudashboard/menudashboard_controller.dart';
import 'package:infinito/app/shared/utils/url_lauch.dart';
import 'package:infinito/app/shared/utils/url_utils.dart';
import 'package:infinito/app/shared/widgets/color_loader.dart';
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
            GestureDetector(
              onTap: () => UrlLauch.launchInBrowser(whatsAppUrlTextHome),
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image(
                        image: AssetImage('assets/images/iconwhats.png'),
                        height: 35,
                        width: 35,
                      ),
                    ),
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
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 30),
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
              height: 200,
              child: StreamBuilder<QuerySnapshot>(
                stream: controller.getTerapiasFromFirestore(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError)
                    return new Text('Error: ${snapshot.error}');
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return Center(child: new ColorLoader());
                    default:
                      return Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          return new HomeTileWidget(
                            document: snapshot.data.documents[index],
                            pageDetailBuild: HomeDetailTerapiaPage(
                                document: snapshot.data.documents[index]),
                          );
                        },
                        itemCount: snapshot.data.documents.length,
                        viewportFraction: 0.6,
                        scale: 0.8,
                        autoplay: true,
                        loop: true,
                        fade: 0.7,
                      );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 10),
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
                height: 200,
                child: StreamBuilder<QuerySnapshot>(
                  stream: controller.getProductsFromFirestore(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError)
                      return new Text('Error: ${snapshot.error}');
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Center(child: new ColorLoader());
                      default:
                        return Swiper(
                          itemBuilder: (BuildContext context, int index) {
                            return new HomeTileWidget(
                              document: snapshot.data.documents[index],
                              pageDetailBuild: HomeDetailProductPage(
                                  document: snapshot.data.documents[index]),
                            );
                          },
                          itemCount: snapshot.data.documents.length,
                          viewportFraction: 0.6,
                          scale: 0.8,
                          autoplay: true,
                          loop: true,
                          fade: 0.7,
                        );
                    }
                  },
                )),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
