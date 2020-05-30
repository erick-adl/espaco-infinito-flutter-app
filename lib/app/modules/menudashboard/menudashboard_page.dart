import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'dashboard.dart';
import 'menu.dart';
import 'menudashboard_controller.dart';

class MenudashboardPage extends StatefulWidget {
  final String title;
  const MenudashboardPage({Key key, this.title = "Menudashboard"})
      : super(key: key);

  @override
  _MenudashboardPageState createState() => _MenudashboardPageState();
}

class _MenudashboardPageState
    extends ModularState<MenudashboardPage, MenudashboardController>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onMenuTap() {
    setState(() {
      if (isCollapsed)
        _controller.forward();
      else
        _controller.reverse();

      isCollapsed = !isCollapsed;
    });
  }

  void onMenuItemClicked() {
    setState(() {
      _controller.reverse();
    });

    isCollapsed = !isCollapsed;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(body: Observer(builder: (context) {
      return Stack(
        children: <Widget>[
          Menu(
            slideAnimation: _slideAnimation,
            menuAnimation: _menuScaleAnimation,
            selectedIndex: controller.index,
            onMenuItemClicked: onMenuItemClicked,
          ),
          Dashboard(
            duration: duration,
            onMenuTap: onMenuTap,
            scaleAnimation: _scaleAnimation,
            isCollapsed: isCollapsed,
            screenWidth: screenWidth,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Material(
                    elevation: 10,
                    child: Container(
                      height: 60,
                      color: Theme.of(context).primaryColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            child: Icon(
                              Icons.menu,
                              color: Colors.white,
                              size: 30,
                            ),
                            onTap: onMenuTap,
                          ),
                          Observer(
                            builder: (context) {
                              return Text(controller.pageName,
                                  style: TextStyle(
                                      fontSize: 24, color: Colors.white));
                            },
                          ),
                          SizedBox(
                            width: 40,
                          ),
                        ],
                      ),
                    ),
                  ),
                  controller.page
                ],
              ),
            ),
          ),
        ],
      );
    }));
  }
}
