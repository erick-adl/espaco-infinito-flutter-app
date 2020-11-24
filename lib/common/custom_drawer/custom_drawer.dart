import 'package:flutter/material.dart';
import 'package:infinito/common/custom_drawer/custom_drawer_header.dart';
import 'package:infinito/common/custom_drawer/drawer_tile.dart';
import 'package:infinito/models/page_manager.dart';
import 'package:infinito/models/user_manager.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 203, 236, 241),
                Colors.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
          ),
          ListView(
            children: <Widget>[
              CustomDrawerHeader(),

              Consumer<UserManager>(
                builder: (_, userManager, __) {
                  return GestureDetector(
                    onTap: () {
                      if (userManager.isLoggedIn) {
                        context.read<PageManager>().setPage(0);
                        userManager.signOut();
                      } else {
                        Navigator.of(context).pushNamed('/login');
                      }
                    },
                    child: SizedBox(
                      height: 60,
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Icon(
                              Icons.exit_to_app,
                              size: 32,
                              color: Colors.grey[700],
                            ),
                          ),
                          Text(
                            userManager.isLoggedIn
                                ? 'Sair'
                                : 'Entre ou cadastre-se',
                            style: TextStyle(
                                fontSize: 18, color: Colors.grey[700]),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
              // DrawerTile(
              //   iconData: Icons.exit_to_app,
              //   title: 'Início',
              // ),
              // DrawerTile(
              //   iconData: Icons.list,
              //   title: 'Produtos',
              //   page: 1,
              // ),
              // DrawerTile(
              //   iconData: Icons.star,
              //   title: 'Terapias',
              //   page: 2,
              // ),
              // DrawerTile(
              //   iconData: Icons.location_on,
              //   title: 'Nossa loja',
              //   page: 3,
              // ),
              // Consumer<UserManager>(
              //   builder: (_, userManager, __) {
              //     if (userManager.adminEnabled) {
              //       return Column(
              //         children: <Widget>[
              //           const Divider(),
              //           DrawerTile(
              //             iconData: Icons.settings,
              //             title: 'Usuários',
              //             page: 4,
              //           ),
              //         ],
              //       );
              //     } else {
              //       return Container();
              //     }
              //   },
              // )
            ],
          ),
        ],
      ),
    );
  }
}
