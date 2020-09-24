import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';

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
  bool autoSlide = true;

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
    if (autoSlide) {
      setState(() {
        _controller.reverse();
      });

      isCollapsed = !isCollapsed;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
        resizeToAvoidBottomPadding: true,
        body: GetX<MenudashboardController>(builder: (_) {
          return SafeArea(
            child: Stack(
              children: <Widget>[
                Menu(
                  slideAnimation: _slideAnimation,
                  menuAnimation: _menuScaleAnimation,
                  selectedIndex: controller.index.value,
                  onMenuItemClicked: onMenuItemClicked,
                ),
                Dashboard(
                  duration: duration,
                  onMenuTap: onMenuTap,
                  scaleAnimation: _scaleAnimation,
                  isCollapsed: isCollapsed,
                  screenWidth: screenWidth,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                          top: 60,
                          child: Container(
                            height: screenHeight - 60,
                            width: screenWidth,
                            color: Theme.of(context).backgroundColor,
                            child: controller.page,
                          )),
                      GetX<MenudashboardController>(builder: (_) {
                        return Material(
                          elevation: 20,
                          color: Theme.of(context).textSelectionColor,
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                            ),
                            child: InkWell(
                              onTap: onMenuTap,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.menu,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  Text(controller.pageName.value,
                                      style: TextStyle(
                                          fontSize: 24, color: Colors.white)),
                                  SizedBox(
                                    width: 30,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
