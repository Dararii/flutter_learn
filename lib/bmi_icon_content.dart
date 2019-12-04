import 'package:flutter/material.dart';

import 'bmi_constants.dart';

class MyIcon extends StatelessWidget {
  final IconData icon;
  final String title;

  MyIcon({Key key, @required this.icon, @required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          title,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
