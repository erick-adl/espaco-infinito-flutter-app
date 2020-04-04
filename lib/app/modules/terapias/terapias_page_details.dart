import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:infinito/app/shared/widgets/custom_button.widget.dart';

class TerapiasPageDetails extends StatelessWidget {
  final DocumentSnapshot document;

  const TerapiasPageDetails({Key key, this.document}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Hero(
            tag: document.documentID,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                  image: DecorationImage(
                      image: NetworkImage(document["foto"]),
                      fit: BoxFit.cover)),
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            child: Text(
              document["nome"],
              style: Theme.of(context).textTheme.body2,
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            child: Text(
              document["descricao"],
              style: Theme.of(context).textTheme.body1,
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            child: CustomButton(
                context: context,
                text: "Venha conhecer o espaço",
                onPressed: null),
          ),
        ],
      ),
    );
  }
}
