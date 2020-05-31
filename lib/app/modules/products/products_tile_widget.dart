import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinito/app/shared/widgets/color_loader.dart';

class ProductsTileWidget extends StatelessWidget {
  final DocumentSnapshot document;

  const ProductsTileWidget({Key key, this.document}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Modular.to.pushNamed("/product_detail", arguments: document),
      child: Card(
        color: Theme.of(context).backgroundColor,
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
                        color: Theme.of(context).primaryColor,
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
                  style: Theme.of(context).textTheme.title,
                ),
              ),
            ),
            Flexible(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "R\$ ${document["valor"]}",
                    style: Theme.of(context).textTheme.body1,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
