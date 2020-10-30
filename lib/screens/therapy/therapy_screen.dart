import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:infinito/common/widgets/color_loader.dart';
import 'package:infinito/helpers/url_lauch.dart';
import 'package:infinito/models/stores_manager.dart';
import 'package:infinito/models/therapies_manager.dart';
import 'package:infinito/models/therapy.dart';
import 'package:infinito/models/user_manager.dart';
import 'package:provider/provider.dart';

class TherapyScreen extends StatelessWidget {
  const TherapyScreen(this.therapy);

  final Therapy therapy;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text(therapy.name),
        centerTitle: true,
        actions: <Widget>[
          Consumer<UserManager>(
            builder: (_, userManager, __) {
              if (userManager.adminEnabled) {
                return IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/edit_therapy',
                        arguments: therapy);
                  },
                );
              } else {
                return Container();
              }
            },
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Hero(
            tag: therapy.id,
            child: AspectRatio(
              aspectRatio: 1,
              child: Carousel(
                images: therapy.images.map((url) {
                  return CachedNetworkImage(
                    imageUrl: url,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    placeholder: (context, url) => Center(child: ColorLoader()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  );
                }).toList(),
                dotSize: 4,
                dotSpacing: 15,
                dotBgColor: Colors.transparent,
                dotColor: primaryColor,
                autoplay: false,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  therapy.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 8),
                  child: Text(
                    'Descrição',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                Text(
                  therapy.description,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 20,
                ),
                Consumer2<TherapiesManager, StoresManager>(
                  builder: (_, therapyManager, storeManager, __) {
                    return SizedBox(
                      height: 44,
                      child: RaisedButton(
                        onPressed: () {
                          final contactNumber =
                              storeManager.stores.first.whatsapp;

                          UrlLauch.launchInBrowser(
                              "https://api.whatsapp.com/send?phone=$contactNumber&text=Ol%C3%A1!%20Gostaria%20de%20mais%20informacões%20sobre%20${therapy.name}");
                        },
                        color: primaryColor,
                        textColor: Colors.white,
                        child: Text(
                          'Duvidas? Venha conversar no WhatsApp',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
