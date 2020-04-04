import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key key,
    @required this.context,
    @required this.text,
    @required this.onPressed,
  }) : super(key: key);

  final BuildContext context;
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
      margin: EdgeInsets.only(top: 10.0),
      width: MediaQuery.of(context).size.width / 1.2,
      height: 50,
      decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 15)]),
      child: MaterialButton(
        color: Color(0xfff6f7ff),
        highlightColor: Colors.transparent,
        splashColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Text(
          text,
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 20.0,
              fontFamily: "WorkSansBold"),
        ),
        onPressed: () => onPressed,
      ),
    );
  }
}
