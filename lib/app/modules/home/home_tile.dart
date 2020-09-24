import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:infinito/app/shared/widgets/color_loader.dart';

class HomeTileWidget extends StatelessWidget {
  final DocumentSnapshot document;
  final Widget pageDetailBuild;

  const HomeTileWidget({
    Key key,
    @required this.document,
    @required this.pageDetailBuild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 200,
      width: 220,
      child: GestureDetector(
        onTap: () => Navigator.push(
            context, _createDetailRoute(pageBuild: pageDetailBuild)),
        child: Container(
          height: 220,
          width: 220,
          child: CachedNetworkImage(
            imageUrl: document["foto"],
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(document["nome"],
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
                  ),
                ],
              ),
            ),
            placeholder: (context, url) => Center(child: ColorLoader()),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
      ),
    );
  }

  Route _createDetailRoute({Widget pageBuild}) {
    return PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 500),
      pageBuilder: (context, animation, secondaryAnimation) => pageBuild,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final begin = Offset(0.0, 1.0);
        final end = Offset.zero;

        final curve = Curves.fastOutSlowIn;

        final tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
