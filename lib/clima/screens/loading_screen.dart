import 'package:flutter/material.dart';
import 'package:flutter_learn/clima/screens/location_screen.dart';
import 'package:flutter_learn/clima/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  WeatherModel weatherModel = WeatherModel();

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    dynamic r = await weatherModel.getLocationWeather();
    print(r);
    Navigator.pushNamed(context, "/clima_location",
        arguments: LocationScreen(
          locationWeather: r,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          size: 100,
          color: Colors.white,
        ),
      ),
    );
  }
}
