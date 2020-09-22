// detail page
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:infinito/app/shared/widgets/color_loader.dart';
import 'package:photo_view/photo_view.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

class HomeDetailProductPage extends StatefulWidget {
  final DocumentSnapshot document;

  const HomeDetailProductPage({
    Key key,
    @required this.document,
  })  : assert(document != null),
        super(key: key);

  @override
  _HomeDetailProductPageState createState() => _HomeDetailProductPageState();
}

class _HomeDetailProductPageState extends State<HomeDetailProductPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  List<Animation> _slideAnimations;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(
          seconds: 1,
        ));
    _slideAnimations = List<Animation>.generate(8, (index) {
      final count = 13;
      final beginInterval = (1 / count) * index;
      final endInterval = 1.0;
      return Tween<double>(
        begin: 0,
        end: 1,
      ).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Interval(
            beginInterval,
            endInterval,
            curve: Curves.fastOutSlowIn,
          ),
        ),
      );
    });

    _animationController.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: Text(widget.document["nome"],
              style: TextStyle(
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 3.0,
                      color: Color(0xFF23185f),
                    ),
                  ],
                  fontSize: 18,
                  color: Colors.white,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
          leading: IconButton(
              icon: Icon(Icons.keyboard_arrow_left),
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              }),
        ),
        body: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: CachedNetworkImage(
            imageUrl: widget.document["foto"],
            imageBuilder: (context, imageProvider) => Container(
              height: MediaQuery.of(context).size.height / 2,
              child: PhotoView(
                backgroundDecoration: BoxDecoration(),
                imageProvider: imageProvider,
                maxScale: PhotoViewComputedScale.covered * 2.0,
                minScale: PhotoViewComputedScale.contained * 0.8,
                initialScale: PhotoViewComputedScale.covered,
              ),
            ),
            placeholder: (context, url) => ColorLoader(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        bottomSheet: SolidBottomSheet(
          maxHeight: 100,
          headerBar: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
            height: 50,
            child: Center(
              child: Text("Saiba mais!",
                  style: TextStyle(
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: 3.0,
                          color: Colors.white,
                        ),
                      ],
                      fontSize: 18,
                      color: Color(0xFF23185f),
                      fontFamily: "Inter",
                      fontWeight: FontWeight.bold)),
            ),
          ),
          body: Container(
            color: Colors.white,
            height: 10,
            child: Center(
              child: RichText(
                text: new TextSpan(
                  style: new TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    new TextSpan(
                        text: "Você encontra esse produto hoje no ",
                        style: TextStyle(
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(1.0, 1.0),
                              blurRadius: 3.0,
                              color: Colors.white,
                            ),
                          ],
                          fontSize: 14,
                          color: Color(0xFF23185f),
                          fontFamily: "Inter",
                        )),
                    new TextSpan(
                        text: "valor ",
                        style: TextStyle(
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(1.0, 1.0),
                                blurRadius: 3.0,
                                color: Colors.white,
                              ),
                            ],
                            fontSize: 14,
                            color: Color(0xFF23185f),
                            fontFamily: "Inter",
                            fontWeight: FontWeight.bold)),
                    new TextSpan(
                        text: "de R\$: ${widget.document["valor"]}. ",
                        style: TextStyle(
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(1.0, 1.0),
                              blurRadius: 3.0,
                              color: Colors.white,
                            ),
                          ],
                          fontSize: 14,
                          color: Color(0xFF23185f),
                          fontFamily: "Inter",
                        )),
                    new TextSpan(
                        text: "Esse produto possuí as seguintes ",
                        style: TextStyle(
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(1.0, 1.0),
                              blurRadius: 3.0,
                              color: Colors.white,
                            ),
                          ],
                          fontSize: 14,
                          color: Color(0xFF23185f),
                          fontFamily: "Inter",
                        )),
                    new TextSpan(
                        text: "medidas",
                        style: TextStyle(
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(1.0, 1.0),
                                blurRadius: 3.0,
                                color: Colors.white,
                              ),
                            ],
                            fontSize: 14,
                            color: Color(0xFF23185f),
                            fontFamily: "Inter",
                            fontWeight: FontWeight.bold)),
                    new TextSpan(
                        text: ": ${widget.document["tamanho"]}.",
                        style: TextStyle(
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(1.0, 1.0),
                              blurRadius: 3.0,
                              color: Colors.white,
                            ),
                          ],
                          fontSize: 14,
                          color: Color(0xFF23185f),
                          fontFamily: "Inter",
                        )),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    _slideAnimations = null;
    super.dispose();
  }

  final Uint8List kTransparentImage = new Uint8List.fromList(<int>[
    0x89,
    0x50,
    0x4E,
    0x47,
    0x0D,
    0x0A,
    0x1A,
    0x0A,
    0x00,
    0x00,
    0x00,
    0x0D,
    0x49,
    0x48,
    0x44,
    0x52,
    0x00,
    0x00,
    0x00,
    0x01,
    0x00,
    0x00,
    0x00,
    0x01,
    0x08,
    0x06,
    0x00,
    0x00,
    0x00,
    0x1F,
    0x15,
    0xC4,
    0x89,
    0x00,
    0x00,
    0x00,
    0x0A,
    0x49,
    0x44,
    0x41,
    0x54,
    0x78,
    0x9C,
    0x63,
    0x00,
    0x01,
    0x00,
    0x00,
    0x05,
    0x00,
    0x01,
    0x0D,
    0x0A,
    0x2D,
    0xB4,
    0x00,
    0x00,
    0x00,
    0x00,
    0x49,
    0x45,
    0x4E,
    0x44,
    0xAE,
  ]);
}
