import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget(
      {Key key,
      @required this.context,
      @required this.textHint,
      @required this.iconDecoration,
      @required this.onChanged,
      @required this.obscureText,
      @required this.textInputType})
      : super(key: key);

  final String textHint;
  final BuildContext context;
  final Icon iconDecoration;
  final void Function(String) onChanged;
  final bool obscureText;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 4, 16, 5),
      margin: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
      width: MediaQuery.of(context).size.width / 1.2,
      height: 50,
      child: TextField(
        keyboardType: textInputType,
        obscureText: obscureText,
        onChanged: onChanged,
        decoration: InputDecoration(
            hintText: textHint, icon: iconDecoration, border: InputBorder.none),
      ),
    );
  }
}
