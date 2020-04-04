import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:infinito/app/shared/widgets/custom_button.widget.dart';
import 'package:infinito/app/shared/widgets/rounded_model.dart';

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
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: new CachedNetworkImageProvider(document["foto"],
                          errorListener: () => Icon(Icons.error)))),
              width: 130,
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
                        _buildDetailsOfCharacter(context, document);
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

  Future<void> _buildDetailsOfCharacter(context, document) async {
    showRoundedModalBottomSheet(
        radius: 25,
        color: Colors.white,
        context: context,
        builder: (BuildContext bc) {
          return ListView(
            shrinkWrap: true,
            children: <Widget>[
              Container(
                height: 300,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(25)),
                    image: DecorationImage(
                        image: NetworkImage(document["foto"]),
                        fit: BoxFit.cover)),
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
          );
        });
  }
}
