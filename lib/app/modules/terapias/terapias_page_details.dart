import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:infinito/app/shared/widgets/color_loader.dart';

class TerapiasPageDetails extends StatelessWidget {
  final DocumentSnapshot document;

  const TerapiasPageDetails({Key key, this.document}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).accentIconTheme,
        title: Text(
          document["nome"],
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: document.documentID,
              child: Container(
                height: 300,
                margin: EdgeInsets.all(10),
                child: CachedNetworkImage(
                  imageUrl: document["foto"],
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => ColorLoader(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              child: Center(
                child: Text(
                  document["nome"],
                  style: Theme.of(context).textTheme.title,
                ),
              ),
            ),
            ...document["descricao"].toString().split(". ").map(
                  (f) => Container(
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Text(
                      f,
                      style: Theme.of(context).textTheme.body1,
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
