import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TerapiasPageDetails extends StatelessWidget {
  final DocumentSnapshot document;

  const TerapiasPageDetails({Key key, this.document}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          document["nome"],
          style: Theme.of(context).textTheme.display1,
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
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                        image: NetworkImage(document["foto"]),
                        fit: BoxFit.cover)),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              child: Center(
                child: Text(
                  document["nome"],
                  style: Theme.of(context).textTheme.body1,
                ),
              ),
            ),
            ...document["descricao"].toString().split(". ").map(
                  (f) => Container(
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Text(
                      f,
                      style: Theme.of(context).textTheme.display3,
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
