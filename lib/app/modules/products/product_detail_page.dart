import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:infinito/app/shared/widgets/color_loader.dart';
import 'package:photo_view/photo_view.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class ProductDetailPage extends StatefulWidget {
  final DocumentSnapshot document;

  const ProductDetailPage({Key key, this.document}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title:
            Text("Detalhes", style: Theme.of(context).accentTextTheme.subtitle),
      ),
      body: SlidingSheet(
        elevation: 4,
        cornerRadius: 16,
        snapSpec: const SnapSpec(
          snappings: [0.5, 0.7, 1.0],
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
              height: MediaQuery.of(context).size.height * 0.30,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(widget.document["nome"],
                          style: Theme.of(context).primaryTextTheme.subtitle),
                      Text("R\$: ${widget.document["valor"]}",
                          style: Theme.of(context).primaryTextTheme.subtitle),
                    ],
                  ),
                  Text(
                    "Descricão do produto:",
                    style: Theme.of(context).primaryTextTheme.subtitle,
                  ),
                  Text(widget.document["descricao"],
                      style: Theme.of(context).primaryTextTheme.body2)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
