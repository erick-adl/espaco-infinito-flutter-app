import 'package:flutter/material.dart';

import 'custon_drawer_menu_widget.dart';

class CustomScaffold extends StatefulWidget {
  final Widget page;
  final String title;

  const CustomScaffold({Key key, this.page, this.title}) : super(key: key);
  @override
  _CustomScaffoldState createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;

  _CustomScaffoldState();

  @override
  void initState() {
    super.initState();
    _animateInit();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      body: Stack(
        children: <Widget>[
          CustonDrawerMenuWidget(),
          buildPage(context, widget.page, widget.title)
        ],
      ),
    );
  }

  Widget menu(context, Widget menu) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(scale: _menuScaleAnimation, child: menu),
    );
  }

  Widget buildPage(BuildContext context, Widget page, String title) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.5 * screenWidth,
      right: isCollapsed ? 0 : -0.2 * screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          animationDuration: duration,
          borderRadius:
              isCollapsed ? null : BorderRadius.all(Radius.circular(40)),
          elevation: 8,
          color: Theme.of(context).primaryColor,
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 35.0, left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      child: Icon(Icons.menu, color: Colors.white),
                      onTap: () {
                        setState(() {
                          if (isCollapsed)
                            _controller.forward();
                          else
                            _controller.reverse();

                          isCollapsed = !isCollapsed;
                        });
                      },
                    ),
                    Text(title, style: Theme.of(context).textTheme.display1),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70.0),
                child: page,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _animateInit() {
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }
}
