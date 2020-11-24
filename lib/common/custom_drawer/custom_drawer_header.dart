import 'package:flutter/material.dart';
import 'package:infinito/models/page_manager.dart';
import 'package:infinito/models/user_manager.dart';
import 'package:provider/provider.dart';

class CustomDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.fromLTRB(32, 24, 16, 8),

      height: 200,

      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 253, 181, 60),
                Color.fromARGB(255, 219, 135, 30),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
          ),
          Consumer<UserManager>(
            builder: (_, userManager, __) {
              return Container(
                padding: const EdgeInsets.fromLTRB(32, 24, 16, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Image(
                      height: 100,
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/logo_infinito.png'),
                    ),
                    Text(
                      'Olá, ${userManager.user?.name ?? ''}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
