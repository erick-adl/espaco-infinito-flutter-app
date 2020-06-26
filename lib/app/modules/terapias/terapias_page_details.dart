import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:infinito/app/shared/utils/url_lauch.dart';
import 'package:infinito/app/shared/widgets/color_loader.dart';

class TerapiasPageDetails extends StatelessWidget {
  final DocumentSnapshot document;

  const TerapiasPageDetails({Key key, this.document}) : super(key: key);

  final textWhats =
      "https://api.whatsapp.com/send?phone=5551989071829&text=Ol%C3%A1!%20Gostaria%20de%20mais%20informacões.%20sobre%20";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),
            ...document["descricao"].toString().split(". ").map(
                  (f) => Container(
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child:
                        Text(f, style: Theme.of(context).textTheme.bodyText1),
                  ),
                ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              width: MediaQuery.of(context).size.width / 1.3,
              height: 50,
              decoration: new BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
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
                    Text("Solicite mais informacões",
                        style: Theme.of(context).accentTextTheme.bodyText1),
                  ],
                ),
                onPressed: () =>
                    UrlLauch.launchInBrowser(textWhats + document["nome"]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
