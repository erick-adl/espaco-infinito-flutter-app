import 'package:flutter/material.dart';

import 'package:infinito/screens/register/device_config.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton(
      {@required this.text, @required this.onPressed, this.enabled = true});
  final String text;
  final Function onPressed;
  final bool enabled;
  @override
  Widget build(BuildContext context) {
    DeviceData _deviceData = DeviceData.init(context);
    return Material(
      elevation: 2,
      shadowColor: Theme.of(context).primaryColor,
      color: Theme.of(context).primaryColor,
      borderRadius:
          BorderRadius.all(Radius.circular(_deviceData.screenWidth * 0.05)),
      child: InkWell(
        onTap: () {
          if (enabled) {
            FocusScope.of(context).unfocus();
            onPressed();
          }
        },
        borderRadius: BorderRadius.circular(_deviceData.screenWidth * 0.05),
        child: Container(
          width: _deviceData.screenWidth * 0.75,
          height: _deviceData.screenHeight * 0.072,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: _deviceData.screenHeight * 0.02,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
