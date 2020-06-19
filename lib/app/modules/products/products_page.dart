import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infinito/app/modules/products/products_controller.dart';
import 'package:infinito/app/modules/products/products_tile_widget.dart';
import 'package:infinito/app/shared/widgets/color_loader.dart';

class ProductsPage extends StatefulWidget {
  final String title;
  const ProductsPage({Key key, this.title = "Products"}) : super(key: key);

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
          !controller.searchBarShow) {
        print("reverse");
        controller.searchBarShow = true;
      }

      if (_scrollController.position.userScrollDirection ==
              ScrollDirection.reverse &&
          controller.searchBarShow) {
        print("foward");
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
      color: theme.backgroundColor,
      child: Column(
        children: <Widget>[
          Observer(builder: (_) {
            return AnimatedContainer(
                duration: Duration(milliseconds: 500),
                height: controller.searchBarShow ? 60 : 0,
                decoration: BoxDecoration(
                    color: theme.primaryColor,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(30))),
                child: controller.searchBarShow
                    ? Container(
                        margin: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                        height: 50,
                        decoration: BoxDecoration(
                            color: theme.backgroundColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            onChanged: (value) => controller.searchKey = value,
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
                      )
                    : Container());
          }),
          Flexible(
            flex: 1,
            child: Container(
              color: theme.backgroundColor,
              width: screenSizeWidth,
              child: Observer(builder: (_) {
                return StreamBuilder<QuerySnapshot>(
                  stream:
                      controller.getProductsFromFirestore(controller.searchKey),
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
    );
  }
}
