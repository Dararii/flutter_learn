import 'package:flutter/material.dart';
import 'package:flutter_learn/bitcoin/price_screen.dart';
import 'package:flutter_learn/bmi_calculator.dart';
import 'package:flutter_learn/bmi_result.dart';
import 'package:flutter_learn/clima/screens/city_screen.dart';
import 'package:flutter_learn/clima/screens/loading_screen.dart';
import 'package:flutter_learn/clima/screens/location_screen.dart';
import 'package:flutter_learn/todoey/todoey_task.dart';
import 'package:flutter_learn/todoey/todoey_task_model_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskProvider>(
      create: (context) => TaskProvider(),
      child: MaterialApp(
        theme: ThemeData.light().copyWith(
          primaryColor: Color(0xFF0A0E21),
          accentColor: Colors.blue[300],
          scaffoldBackgroundColor: Color(0xFF0A0E21),
        ),
        initialRoute: "/",
        routes: {
          "/": (context) => TaskScreen(),
          "/bmi_calc": (context) =>
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
          "/todoey_task": (context) => TaskScreen(),
        },
        darkTheme: ThemeData.dark(),
      ),
    );
  }
}
