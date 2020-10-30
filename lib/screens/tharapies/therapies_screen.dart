import 'package:flutter/material.dart';
import 'package:infinito/common/custom_drawer/custom_drawer.dart';
import 'package:infinito/models/therapies_manager.dart';
import 'package:infinito/models/user_manager.dart';
import 'package:infinito/screens/products/components/search_dialog.dart';
import 'package:infinito/screens/tharapies/components/theray_list_tile..dart';
import 'package:provider/provider.dart';

class TherapiesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Consumer<TherapiesManager>(
          builder: (_, therapiesManager, __) {
            if (therapiesManager.search.isEmpty) {
              return const Text('Terapias');
            } else {
              return LayoutBuilder(
                builder: (_, constraints) {
                  return GestureDetector(
                    onTap: () async {
                      final search = await showDialog<String>(
                          context: context,
                          builder: (_) =>
                              SearchDialog(therapiesManager.search));
                      if (search != null) {
                        therapiesManager.search = search;
                      }
                    },
                    child: Container(
                        width: constraints.biggest.width,
                        child: Text(
                          therapiesManager.search,
                          textAlign: TextAlign.center,
                        )),
                  );
                },
              );
            }
          },
        ),
        centerTitle: true,
        actions: <Widget>[
          Consumer<TherapiesManager>(
            builder: (_, therapiesManager, __) {
              if (therapiesManager.search.isEmpty) {
                return IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () async {
                    final search = await showDialog<String>(
                        context: context,
                        builder: (_) => SearchDialog(therapiesManager.search));
                    if (search != null) {
                      therapiesManager.search = search;
                    }
                  },
                );
              } else {
                return IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () async {
                    therapiesManager.search = '';
                  },
                );
              }
            },
          ),
          Consumer<UserManager>(
            builder: (_, userManager, __) {
              if (userManager.adminEnabled) {
                return IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      '/edit_therapy',
                    );
                  },
                );
              } else {
                return Container();
              }
            },
          )
        ],
      ),
      body: Consumer<TherapiesManager>(
        builder: (_, therapiesManager, __) {
          final filteredTherapies = therapiesManager.filteredTherapies;
          return ListView.builder(
              itemCount: filteredTherapies.length,
              itemBuilder: (_, index) {
                return TherapyListTile(filteredTherapies[index]);
              });
        },
      ),
    );
  }
}
