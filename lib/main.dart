import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("I Am Rich"),
            backgroundColor: Colors.blue,
          ),
          backgroundColor: Colors.teal,
          body: DicePage()
      ),
    );
  }
}

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

class Bio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        verticalDirection: VerticalDirection.down,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
              radius: 64,
              backgroundImage: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSHAfyJ1fgTNr06h1ItOkStVBwrVxM8DAJUA4j7x056nZIfyJTJ")),
          Text(
            "Kang Ji Young",
            style: TextStyle(
                fontSize: 40,
                fontFamily: "Pacifico",
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          Text(
            "FLUTTER DEVELOPER",
            style: TextStyle(
              fontSize: 20,
              fontFamily: "Source Sans Pro",
              color: Colors.teal.shade100,
            ),
          ),
          SizedBox(
            width: 150,
            child: Divider(
              color: Colors.teal.shade100,
            ),
          ),
          Container(
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            padding: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.phone,
                  size: 24,
                  color: Colors.teal,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "+62 81341333641",
                  style: TextStyle(
                      color: Colors.teal.shade900,
                      fontFamily: "Source Sans Pro",
                      fontSize: 20),
                )
              ],
            ),
          ),
          Card(
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            child: ListTile(
                leading: Icon(
                  Icons.email,
                  size: 24,
                  color: Colors.teal,
                ),
                title: Text(
                  "darari7@gmail.com",
                  style: TextStyle(
                      color: Colors.teal.shade900,
                      fontFamily: "Source Sans Pro",
                      fontSize: 20),
                )),
          ),
        ],
      ),
    );
  }
}
