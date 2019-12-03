import 'dart:math';

import 'package:flutter/material.dart';

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int diceNumber1 = 5;
  int diceNumber2 = 1;

  void dicePress() {
    diceNumber2 = Random().nextInt(6) + 1;
    if (diceNumber2 == 6)
      diceNumber1 = 1;
    else
      diceNumber1 = diceNumber2 + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: () {
                print("Btn 1");
                setState(() {
                  dicePress();
                });
              },
              child: Image.asset("images/dice$diceNumber1.png"),
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: () {
                print("Btn 1");
                setState(() {
                  dicePress();
                });
              },
              child: Image.asset("images/dice$diceNumber2.png"),
            ),
          ),
        ],
      ),
    );
  }
}
