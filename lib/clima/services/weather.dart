import 'package:flutter_learn/clima/services/location.dart';
import 'package:flutter_learn/clima/services/networking.dart';

class WeatherModel {
  final String kAPI = "b16f2eeb85fd3de0c23c7ee3cda6ba50";
  LocationEngine locationEngine = LocationEngine();
  NetworkEngine networkEngine = NetworkEngine();

  Future<dynamic> getLocationWeather() async {
    await locationEngine.getCurrentLocation();
    print(locationEngine.latitude);
    print(locationEngine.longitude);
    String url =
        "https://api.openweathermap.org/data/2.5/weather?lat=${locationEngine.latitude}&lon=${locationEngine.longitude}&appid=$kAPI";
    print(url);
    var r = await networkEngine.getData(url);

    return r;
  }

  Future<dynamic> getCityWeather(String cityName) async {
    String url =
        "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$kAPI";
    print(url);
    var r = await networkEngine.getData(url);

    return r;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
