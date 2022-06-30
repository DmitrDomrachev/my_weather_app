import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:my_weather_app/model/weather_model.dart';

class WeatherApi {
  static const String weatherAppId = "dc791ef3a868e65b00266a0c72a6439a";
  static const String weatherBaseSchema = "https://";
  static const String weatherBaseUrl = "api.openweathermap.org";

  static const String weatherForecast = "/data/2.5/forecast";

  Future<WeatherForecast> fetchWeatherForecast(
      {required Future<Position> position}) async {
    print("fetchWeatherForecast");
    var queryParameters = {
      'appid': weatherAppId,
      'units': 'metric',
      'lat': await position.then((value) => value.latitude.toString()),
      'lon': await position.then((value) => value.longitude.toString())
    };

    var uri =  Uri.https(weatherBaseUrl, weatherForecast, queryParameters);
    print("Uri ${uri}");
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      WeatherForecast weatherForecast =
          WeatherForecast.fromJson(json.decode(response.body));
      return weatherForecast;
    } else {
      throw Exception("Error response ${response.statusCode}");
    }
  }
}
