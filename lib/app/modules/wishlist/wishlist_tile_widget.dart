import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinito/app/shared/widgets/color_loader.dart';

class WishlistTileWidget extends StatelessWidget {
  final DocumentSnapshot document;

  const WishlistTileWidget({Key key, this.document}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Modular.to.pushNamed("/wish_detail", arguments: document),
      child: Card(
        color: Theme.of(context).primaryColor,
        margin: EdgeInsets.all(10),
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              flex: 8,
              child: Hero(
                tag: document.documentID,
                child: Container(
                  child: CachedNetworkImage(
                    imageUrl: document["foto"],
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).backgroundColor,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => Center(child: ColorLoader()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  document["nome"],
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: 3.0,
                          color: Colors.white,
                        ),
                      ],
                      fontSize: 15,
                      color: Color(0xFF23185f),
                      fontFamily: "Inter",
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                  child: Text(
                    "R\$ ${document["valor"]}",
                    style: TextStyle(
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(1.0, 1.0),
                            blurRadius: 3.0,
                            color: Colors.white,
                          ),
                        ],
                        fontSize: 15,
                        color: Color(0xFF23185f),
                        fontFamily: "Inter",
                        fontWeight: FontWeight.normal),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
