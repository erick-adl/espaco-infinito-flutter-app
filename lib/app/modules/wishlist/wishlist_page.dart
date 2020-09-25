import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinito/app/shared/utils/url_utils.dart';
import 'package:infinito/app/shared/widgets/color_loader.dart';
import 'package:infinito/app/shared/utils/url_lauch.dart';
import 'package:infinito/app/modules/wishlist/wishlist_tile_widget.dart';
import 'package:infinito/app/modules/wishlist/wishlist_controller.dart';

class WishlistPage extends StatefulWidget {
  final String title;
  const WishlistPage({Key key, this.title = "Lista de desejos"})
      : super(key: key);

  @override
  _WishlistPageState createState() => _WishlistPageState();
}

class _WishlistPageState extends ModularState<WishlistPage, WishlistController>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollController = new ScrollController();

  AsyncSnapshot<QuerySnapshot> _querySnapshot;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: <Widget>[
          _buildWhatsAppRequestInfo(context),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: controller.getWishlistFromFirestore(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError)
                  return new Text('Error: ${snapshot.error}');
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Center(child: new ColorLoader());
                  default:
                    _querySnapshot = snapshot;
                    return new GridView(
                      controller: _scrollController,
                      children: snapshot.data.documents
                          .map((DocumentSnapshot document) {
                        return new WishlistTileWidget(
                          document: document,
                        );
                      }).toList(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 0.7),
                    );
                }
              },
            ),
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }

  _buildWhatsAppRequestInfo(BuildContext context) {
    return GestureDetector(
      onTap: _shareWishList,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RichText(
            text: new TextSpan(
              style: new TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
              children: <TextSpan>[
                new TextSpan(
                    text: 'Envie',
                    style: TextStyle(
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(1.0, 1.0),
                            blurRadius: 3.0,
                            color: Colors.white,
                          ),
                        ],
                        fontSize: 14,
                        color: Color(0xFF23185f),
                        fontFamily: "Inter",
                        fontWeight: FontWeight.bold)),
                new TextSpan(
                    text: ' para um de nossos atendentes',
                    style: TextStyle(
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: 3.0,
                          color: Colors.white,
                        ),
                      ],
                      fontSize: 14,
                      color: Color(0xFF23185f),
                      fontFamily: "Inter",
                    )),
              ],
            ),
            maxLines: 2,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image(
              image: AssetImage('assets/images/iconwhats.png'),
              height: 35,
              width: 35,
            ),
          ),
        ],
      ),
    );
  }

  _shareWishList() {
    var listName = _querySnapshot.data.documents
        .map((e) => '${e["nome"]}%0A')
        .toList()
        .join();
    listName = listName.substring(1, listName.length);

    print(listName);
    UrlLauch.launchInBrowser(whatsAppUrlTextWishList + listName);
  }
}
