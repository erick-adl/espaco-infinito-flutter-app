import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:infinito/app/modules/products/products_controller.dart';
import 'package:infinito/app/modules/products/products_tile_widget.dart';
import 'package:infinito/app/shared/widgets/color_loader.dart';

class ProductsPage extends StatefulWidget {
  final String title;
  const ProductsPage({Key key, this.title = "Produtos"}) : super(key: key);

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends ModularState<ProductsPage, ProductsController>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollController = new ScrollController();

  void _setScrollControl() async {
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
              ScrollDirection.forward &&
          !controller.searchBarShow.value) {
        controller.searchBarShow.value = true;
      }

      if (_scrollController.position.userScrollDirection ==
              ScrollDirection.reverse &&
          controller.searchBarShow.value) {
        controller.searchBarShow.value = false;
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
      body: Container(
        color: theme.backgroundColor,
        child: Column(
          children: <Widget>[
            Obx(() => AnimatedContainer(
                duration: Duration(milliseconds: 500),
                height: controller.searchBarShow.value ? 60 : 0,
                child: Visibility(
                  visible: controller.searchBarShow.value,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                    height: 50,
                    decoration: BoxDecoration(
                        color: theme.backgroundColor,
                        border: Border.all(
                          color: Color(0xFFffa726),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextField(
                        onChanged: (value) =>
                            controller.searchKey.value = value,
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
                          hintText: "Pesquise aqui...",
                          hintStyle: TextStyle(
                              fontFamily: "WorkSansSemiBold", fontSize: 17.0),
                        ),
                      ),
                    ),
                  ),
                ))),
            Flexible(
              flex: 1,
              child: Container(
                color: theme.backgroundColor,
                width: screenSizeWidth,
                child: GetX<ProductsController>(builder: (_) {
                  return StreamBuilder<QuerySnapshot>(
                    stream: controller
                        .getProductsFromFirestore(controller.searchKey.value),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError)
                        return new Text('Error: ${snapshot.error}');
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return Center(child: new ColorLoader());
                        default:
                          return new GridView(
                            controller: _scrollController,
                            children: snapshot.data.documents
                                .map((DocumentSnapshot document) {
                              return new ProductsTileWidget(
                                document: document,
                              );
                            }).toList(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 0.7),
                          );
                      }
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
