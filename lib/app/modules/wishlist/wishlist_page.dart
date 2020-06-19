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
            flex: 6,
            child: Container(
              color: theme.backgroundColor,
              width: screenSizeWidth,
              child: Observer(builder: (_) {
                return StreamBuilder<QuerySnapshot>(
                  stream:
                      controller.getWishlistFromFirestore(controller.searchKey),
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
          Flexible(
            child: buildWhatsAppRequestInfo(context),
            flex: 1,
          )
        ],
      ),
    );
  }

  buildWhatsAppRequestInfo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 80,
        child: MaterialButton(
          height: 70,
          minWidth: MediaQuery.of(context).size.width,
          color: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50))),
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
              Expanded(
                child: Text("Compartilhe sua lista com um de nossos atendentes",
                    maxLines: 2,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).accentTextTheme.bodyText1),
              ),
            ],
          ),
          onPressed: () {
            String urlTextWhats =
                "https://api.whatsapp.com/send?phone=5551991928250&text=Ol%C3%A1!%20Gostaria%20de%20comprar%20os%20seguintes%20itens:%0A";
            var listName = _querySnapshot.data.documents
                .map((e) => '${e["nome"]}%0A')
                .toList()
                .join();
            listName = listName.substring(1, listName.length);

            print(listName);
            UrlLauch.launchInBrowser(urlTextWhats + listName);
          },
        ),
      ),
    );
  }
}
