import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key key,
      @required this.text,
      this.context,
      @required this.fun,
      this.color})
      : super(key: key);

  final BuildContext context;
  final String text;
  final void Function() fun;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
      child: GestureDetector(
        onTap: fun,
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width / 1.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xffffffff), Color(0xfff5851f)]),
          ),
          child: Center(
            child: Text(
              this.text.toUpperCase(),
              style:
                  TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
