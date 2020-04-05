import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TerapiasTileWidget extends StatelessWidget {
  final DocumentSnapshot document;

  const TerapiasTileWidget({Key key, this.document}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Modular.to.pushNamed("/terapia_details", arguments: document),
      child: Card(
        margin: EdgeInsets.all(8),
        elevation: 3,
        color: Theme.of(context).secondaryHeaderColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Flexible(
              flex: 8,
              child: Hero(
                tag: document.documentID,
                child: Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: new CachedNetworkImageProvider(
                              document["foto"],
                              errorListener: () => Icon(Icons.error)))),
                ),
              ),
            ),
            Flexible(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 7, right: 7),
                  child: Text(
                    document["nome"],
                    style: Theme.of(context).textTheme.display2,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
