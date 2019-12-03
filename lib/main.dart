import 'package:flutter/material.dart';
import 'package:flutter_learn/destiny_main.dart';

void main() => runApp(MyApp());

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
          body: StoryPage()
      ),
    );
  }
}
