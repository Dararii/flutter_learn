import 'package:flutter/material.dart';
import 'package:flutter_learn/bmi_calculator.dart';
import 'package:flutter_learn/bmi_result.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        accentColor: Colors.blue[300],
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) =>
            Scaffold(
              appBar: AppBar(
                title: Text("BMI Calculator"),
                //backgroundColor: Colors.blue,
              ),
              //backgroundColor: Colors.teal,
              body: BMICalculator(),
            ),
        "/bmi_result": (context) => ResultPage()
      },
      darkTheme: ThemeData.dark(),
    );
  }
}
