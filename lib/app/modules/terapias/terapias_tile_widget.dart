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
      child: Container(
        height: 180,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(blurRadius: 70, spreadRadius: -80, offset: Offset(0, 40))
        ]),
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 8,
                child: Hero(
                  tag: document.documentID,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
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
                  child: Center(
                    child: Text(
                      document["nome"],
                      style: Theme.of(context).textTheme.headline,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
