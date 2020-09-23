import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:infinito/app/modules/products/products_controller.dart';
import 'package:infinito/app/shared/utils/url_lauch.dart';
import 'package:infinito/app/shared/widgets/color_loader.dart';
import 'package:photo_view/photo_view.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class ProductDetailPage extends StatefulWidget {
  final DocumentSnapshot document;

  const ProductDetailPage({Key key, this.document}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState
    extends ModularState<ProductDetailPage, ProductsController> {
  String urlTextWhats =
      "https://api.whatsapp.com/send?phone=5551989071829&text=Ol%C3%A1!%20Gostaria%20de%20mais%20informacões.%20sobre%20o%20produto%20";

  @override
  Widget build(BuildContext context) {
    controller.getDocumentFromFirestore(widget.document);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Detalhes",
            style: Theme.of(context).accentTextTheme.bodyText2),
      ),
      body: SlidingSheet(
        elevation: 2,
        cornerRadius: 10,
        snapSpec: const SnapSpec(
          initialSnap: 1,
          snappings: [0.1, 0.5, 1.0],
          positioning: SnapPositioning.relativeToSheetHeight,
        ),
        body: buildHeroImageCenter(),
        builder: (context, state) {
          return buildProductInfo(context);
        },
      ),
    );
  }

  Padding buildProductInfo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Container(
        height: MediaQuery.of(context).size.height / 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Icon(
                Icons.keyboard_arrow_down,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Text(widget.document["nome"].toString().trim(),
                style: Theme.of(context).primaryTextTheme.bodyText2),
            Text("Valor: R\$: ${widget.document["valor"]}",
                style: Theme.of(context).primaryTextTheme.bodyText2),
            Text("Tamanho: ${widget.document["tamanho"]}",
                style: Theme.of(context).primaryTextTheme.bodyText2),
            buildWhatsAppRequestInfo(context),
            buildAddItemToWishList(context)
          ],
        ),
      ),
    );
  }

  Hero buildHeroImageCenter() {
    return Hero(
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
        ));
  }

  Center buildWhatsAppRequestInfo(BuildContext context) {
    return Center(
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
              UrlLauch.launchInBrowser(urlTextWhats + widget.document["nome"]),
        ),
      ),
    );
  }

  Center buildAddItemToWishList(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 10.0),
        width: MediaQuery.of(context).size.width / 1.3,
        height: 50,
        decoration: new BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        child: Obx(() => Visibility(
              visible: controller.documentAlreadyAdded.value,
              child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Text("Remover a Lista de Desejos",
                      style: Theme.of(context).accentTextTheme.bodyText1),
                  onPressed: () =>
                      controller.removeProductToWishList(widget.document)),
              replacement: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Text("Adicionar a Lista de Desejos",
                      style: Theme.of(context).accentTextTheme.bodyText1),
                  onPressed: () =>
                      {controller.addProductToWishList(widget.document)}),
            )),
      ),
    );
  }
}
