import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infinito/app/modules/wishlist/wishlist_controller.dart';
import 'package:infinito/app/modules/wishlist/wishlist_tile_widget.dart';
import 'package:infinito/app/shared/utils/url_lauch.dart';
import 'package:infinito/app/shared/widgets/color_loader.dart';

class WishlistPage extends StatefulWidget {
  final String title;
  const WishlistPage({Key key, this.title = "Wishlist"}) : super(key: key);

  @override
  _WishlistPageState createState() => _WishlistPageState();
}

class _WishlistPageState extends ModularState<WishlistPage, WishlistController>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollController = new ScrollController();

  AsyncSnapshot<QuerySnapshot> _querySnapshot;

  void _setScrollControl() async {
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
              ScrollDirection.forward &&
          !controller.shareButtonShow) {
        print("reverse");
        controller.shareButtonShow = true;
      }

      if (_scrollController.position.userScrollDirection ==
              ScrollDirection.reverse &&
          controller.shareButtonShow) {
        print("foward");
        controller.shareButtonShow = false;
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
    double screenSizeWidth = MediaQuery.of(context).size.width;

    final theme = Theme.of(context);
    return Column(
      children: <Widget>[
        _buildWhatsAppRequestInfo(context),
        Expanded(
          // color: theme.backgroundColor,
          // width: screenSizeWidth,
          child: Observer(builder: (_) {
            return StreamBuilder<QuerySnapshot>(
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
            );
          }),
        ),
        SizedBox(
          height: 30,
        )
      ],
    );
  }

  _buildWhatsAppRequestInfo(BuildContext context) {
    return GestureDetector(
      onTap: () {
        String urlTextWhats =
            "https://api.whatsapp.com/send?phone=5551989071829&text=Ol%C3%A1!%20Gostaria%20de%20comprar%20os%20seguintes%20itens:%0A";
        var listName = _querySnapshot.data.documents
            .map((e) => '${e["nome"]}%0A')
            .toList()
            .join();
        listName = listName.substring(1, listName.length);

        print(listName);
        UrlLauch.launchInBrowser(urlTextWhats + listName);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image(
              image: AssetImage('assets/images/iconwhats.png'),
              height: 35,
              width: 35,
            ),
          ),
          Expanded(
            child: RichText(
              text: new TextSpan(
                style: new TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  new TextSpan(
                      text: 'Compartilhe',
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
                      text: ' com uma de nossos atendentes',
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
          ),
        ],
      ),
    );
  }
}
