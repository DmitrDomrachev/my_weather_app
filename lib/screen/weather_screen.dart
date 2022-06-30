import 'package:flutter/material.dart';
import 'package:my_weather_app/api/weather_api.dart';
import 'package:my_weather_app/model/weather_model.dart';
import 'package:my_weather_app/widgets/app_name_widget.dart';
import 'package:my_weather_app/widgets/current_weather.dart';
import 'package:my_weather_app/widgets/current_weather_description_widget.dart';
import 'package:my_weather_app/widgets/weekly_weather_widget.dart';
import 'package:geolocator/geolocator.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late Future<WeatherForecast> forecastObject;

  // final String _cityName = 'Moscow';

  Position? _position;

  // void getCurrentLocation() async {
  //   print("getCurrentLocation");
  //   Position position = await _determinePosition();
  //   print(position);
  //   setState(() {
  //     _position = position;
  //     print("position: $_position");
  //   });
  // }

  Future<Position> _determinePosition() async {
    LocationPermission locationPermission;
    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }
    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    forecastObject = WeatherApi().fetchWeatherForecast(position: _determinePosition());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<WeatherForecast>(
          future: forecastObject,
          builder: (context, snapshot) {
            return Column(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  flex: 3,
                  child: AppName(snapshot),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 4,
                  child: CurrentWeatherDescription(snapshot),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 6,
                  child: CurrentWeather(snapshot),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 3,
                  child: WeeklyWeather(snapshot),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
