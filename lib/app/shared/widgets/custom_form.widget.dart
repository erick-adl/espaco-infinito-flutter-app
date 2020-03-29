import 'package:flutter/material.dart';

class CustomFormWidget extends StatelessWidget {
  const CustomFormWidget({
    Key key,
    @required this.context,
    @required this.children,
  }) : super(key: key);

  final BuildContext context;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 50),
      child: Column(children: children),
    );
  }
}
