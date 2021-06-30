import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apikey='878eec6eeb1410d95f2e57bd7ea09b89';

class WeatherModel {
  double latitude;
  double longitude;
  Future<dynamic> cityName(String name) async {
    NetworkHelper networkHelper=NetworkHelper('https://api.openweathermap.org/data/2.5/weather?q=$name&appid=$apikey&units=metric');
    var data=await networkHelper.getData();
    return data;
  }
  Future<dynamic> getWeather() async{
    Location location=Location();
    await location.getCurrentLocation();
    latitude=location.latitude;
    longitude=location.longitude;
    NetworkHelper helper=NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apikey&units=metric');
    var data=await helper.getData();
    return data;
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
