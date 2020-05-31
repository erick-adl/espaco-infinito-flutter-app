import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key key,
    @required this.context,
    @required this.text,
    @required this.onPressed,
    this.milked = false,
  }) : super(key: key);

  final bool milked;
  final BuildContext context;
  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      width: MediaQuery.of(context).size.width / 1.2,
      height: 50,
      decoration: new BoxDecoration(
        color: milked
            ? Theme.of(context).primaryColor
            : Theme.of(context).cardColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          style: milked
              ? Theme.of(context).accentTextTheme.button
              : Theme.of(context).primaryTextTheme.button,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
