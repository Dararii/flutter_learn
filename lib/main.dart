import 'package:flutter/material.dart';
import 'package:flutter_learn/bitcoin/price_screen.dart';
import 'package:flutter_learn/bmi_calculator.dart';
import 'package:flutter_learn/bmi_result.dart';
import 'package:flutter_learn/clima/screens/city_screen.dart';
import 'package:flutter_learn/clima/screens/loading_screen.dart';
import 'package:flutter_learn/clima/screens/location_screen.dart';

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
      initialRoute: "/bitcoin_price",
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
        "/bmi_result": (context) => ResultPage(),
        "/clima": (context) => LoadingScreen(),
        "/clima_location": (context) => LocationScreen(),
        "/clima_city": (context) => CityScreen(),
        "/bitcoin_price": (context) => PriceScreen(),
      },
      darkTheme: ThemeData.dark(),
    );
  }
}
