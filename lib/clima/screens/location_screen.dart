import 'package:flutter/material.dart';
import 'package:flutter_learn/clima/screens/city_screen.dart';
import 'package:flutter_learn/clima/services/weather.dart';
import 'package:flutter_learn/clima/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;

  const LocationScreen({Key key, this.locationWeather}) : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  LocationScreen args;
  WeatherModel weather;
  double temp = 0;
  int cond = 0;
  String city = "";
  String icon = "";
  String msg = "";

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      setState(() {
        args = ModalRoute.of(context).settings.arguments;
        weather = WeatherModel();
        updateUI(args.locationWeather);
      });
    });
  }

  void updateUI(dynamic data) {
    temp = data['main']['temp'];
    icon = weather.getWeatherIcon(data['weather'][0]['id']);
    msg = weather.getMessage((temp - 273).toInt());
    city = data['name'];

    print(temp);
  }

  @override
  Widget build(BuildContext context) {
//    args = ModalRoute.of(context).settings.arguments;
//    print(args.locationWeather);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      dynamic r = await weather.getLocationWeather();
                      setState(() {
                        updateUI(r);
                      });
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var typedName = await Navigator.pushNamed(
                        context,
                        "/clima_city",
                        arguments: CityScreen(),
                      );
                      print(typedName);
                      if (typedName != "") {
                        dynamic r = await weather.getCityWeather(typedName);
                        setState(() {
                          updateUI(r);
                        });
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '${(temp - 273).toStringAsFixed(0)}°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      icon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$msg in $city!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
