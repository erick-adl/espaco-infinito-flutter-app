import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infinito/app/modules/custom_drawer/custom_drawer.dart';
import 'package:infinito/app/modules/home/home_detail_cursos.dart';
import 'package:infinito/app/modules/home/home_detail_product_page.dart';
import 'package:infinito/app/modules/home/home_detail_terapia_page.dart';

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
  FSBStatus status;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              padding: EdgeInsets.only(left: 0),
              alignment: Alignment.centerLeft,
              onPressed: () {
                setState(() {
                  status = status == FSBStatus.FSB_OPEN
                      ? FSBStatus.FSB_CLOSE
                      : FSBStatus.FSB_OPEN;
                });
              },
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
            Image(
              image: AssetImage('assets/images/logo_infinito.png'),
              height: 60,
              width: 60,
            ),
            IconButton(
              padding: EdgeInsets.only(right: 0),
              alignment: Alignment.centerRight,
              onPressed: () {},
              icon: Icon(
                FontAwesomeIcons.questionCircle,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
      body: FoldableSidebarBuilder(
        screenContents:
            HomeScreenContents(theme: theme, controller: controller),
        drawer: CustomDrawer(
          closeDrawer: () {
            setState(() {
              status = status == FSBStatus.FSB_OPEN
                  ? FSBStatus.FSB_CLOSE
                  : FSBStatus.FSB_OPEN;
            });
          },
        ),
        status: status,
      ),
    );
  }
}

class HomeScreenContents extends StatelessWidget {
  const HomeScreenContents({
    Key key,
    @required this.theme,
    @required this.controller,
  }) : super(key: key);

  final ThemeData theme;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
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
                onTap: () => Modular.to.pushNamed("/cursos"),
                child: Text("Cursos e Palestras",
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
                stream: controller.getCursosPalestrasFromFirestore(),
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
                            pageDetailBuild: HomeDetailCursosPage(
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
              padding: const EdgeInsets.only(left: 15, top: 30),
              child: GestureDetector(
                onTap: () => Modular.to.pushNamed("/terapias"),
                child: Text("Conheça nossas terapias",
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
                onTap: () => Modular.to.pushNamed("/produtos"),
                child: Text("Produtos holisticos",
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
