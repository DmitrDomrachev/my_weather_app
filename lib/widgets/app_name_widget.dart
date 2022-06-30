import 'package:flutter/material.dart';
import 'package:my_weather_app/model/weather_model.dart';

class AppName extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const AppName(this.snapshot);

  @override
  Widget build(BuildContext context) {
    String city = snapshot.data?.city?.name ?? "Canada";
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          city,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Text(
          "WeatherMapApi",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
