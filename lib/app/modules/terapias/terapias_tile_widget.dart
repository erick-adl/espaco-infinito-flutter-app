import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TerapiasTileWidget extends StatelessWidget {
  final DocumentSnapshot document;

  const TerapiasTileWidget({Key key, this.document}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 16, 0, 16),
      height: 180,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(blurRadius: 70, spreadRadius: -80, offset: Offset(0, 40))
      ]),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(right: Radius.circular(30))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Hero(
              tag: document.documentID,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: new CachedNetworkImageProvider(document["foto"],
                            errorListener: () => Icon(Icons.error)))),
                width: 130,
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        document["nome"],
                        style: Theme.of(context).textTheme.body1,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 9),
                        child: Text(
                          document["resumo"],
                          style: Theme.of(context).textTheme.headline,
                          maxLines: 6,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 0),
                      onTap: () {
                        Modular.to
                            .pushNamed("/terapia_details", arguments: document);
                        // _buildDetailsOfCharacter(context, document);
                      },
                      title: Text(
                        'Mais informações',
                        style: Theme.of(context).textTheme.headline,
                      ),
                      trailing: Icon(Icons.navigate_next),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
