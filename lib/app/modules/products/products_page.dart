import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infinito/app/modules/products/products_tile_widget.dart';
import 'package:infinito/app/shared/widgets/color_loader.dart';
import 'package:intl/intl.dart';

class ProductsPage extends StatefulWidget {
  final String title;
  const ProductsPage({Key key, this.title = "Products"}) : super(key: key);

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  String searchKey = "";

  @override
  Widget build(BuildContext context) {
    return buildProductsPage();
  }

  buildProductsPage() {
    return Container(
      height: MediaQuery.of(context).size.height / 1.13,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
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
            Container(
              height: MediaQuery.of(context).size.height / 1.17,
              width: MediaQuery.of(context).size.width,
              child: StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance
                    .collection('products')
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
                      return new GridView(
                        // padding: EdgeInsets.all(),
                        children: snapshot.data.documents
                            .map((DocumentSnapshot document) {
                          return new ProductsTileWidget(
                            document: document,
                          );
                        }).toList(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.7),
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
      ),
    );
  }
}
