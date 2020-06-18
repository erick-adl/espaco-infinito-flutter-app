import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:infinito/app/shared/utils/url_lauch.dart';

import 'package:infinito/app/shared/widgets/color_loader.dart';
import 'package:photo_view/photo_view.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class WishlistDetailPage extends StatefulWidget {
  final DocumentSnapshot document;

  const WishlistDetailPage({Key key, this.document}) : super(key: key);

  @override
  _WishlistDetailPageState createState() => _WishlistDetailPageState();
}

class _WishlistDetailPageState extends State<WishlistDetailPage> {
  String urlTextWhats =
      "https://api.whatsapp.com/send?phone=5551991566635&text=Ol%C3%A1!%20Gostaria%20de%20mais%20informacões.%20sobre%20o%20produto%20";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Detalhes",
            style: Theme.of(context).accentTextTheme.bodyText2),
      ),
      body: SlidingSheet(
        elevation: 4,
        cornerRadius: 16,
        snapSpec: const SnapSpec(
          snappings: [0.4, 0.6, 1.0],
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        body: Hero(
            tag: widget.document.documentID,
            child: CachedNetworkImage(
              imageUrl: widget.document["foto"],
              imageBuilder: (context, imageProvider) => Container(
                height: MediaQuery.of(context).size.height / 2,
                child: PhotoView(
                  backgroundDecoration: BoxDecoration(),
                  imageProvider: imageProvider,
                  maxScale: PhotoViewComputedScale.covered * 2.0,
                  minScale: PhotoViewComputedScale.contained * 0.8,
                  initialScale: PhotoViewComputedScale.contained,
                ),
              ),
              placeholder: (context, url) => ColorLoader(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            )),
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(widget.document["nome"],
                      style: Theme.of(context).primaryTextTheme.bodyText2),
                  Text("Valor: R\$: ${widget.document["valor"]}",
                      style: Theme.of(context).primaryTextTheme.bodyText2),
                  Text("Tamanho: ${widget.document["tamanho"]}",
                      style: Theme.of(context).primaryTextTheme.bodyText2),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 10.0),
                      width: MediaQuery.of(context).size.width / 1.3,
                      height: 50,
                      decoration: new BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image(
                                image:
                                    AssetImage('assets/images/iconwhats.png'),
                                height: 35,
                                width: 35,
                              ),
                            ),
                            Text("Solicite mais informacões",
                                style: Theme.of(context)
                                    .accentTextTheme
                                    .bodyText2),
                          ],
                        ),
                        onPressed: () => UrlLauch.launchInBrowser(
                            urlTextWhats + widget.document["nome"]),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
