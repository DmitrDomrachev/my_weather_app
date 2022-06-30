import 'package:flutter/material.dart';
import 'package:my_weather_app/model/weather_model.dart';
import 'package:my_weather_app/utils/weather_utils.dart';

class CurrentWeatherDescription extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const CurrentWeatherDescription(this.snapshot);

  @override
  Widget build(BuildContext context) {
    String weatherDescr =
        snapshot.data?.list?[0].weather?[0].main.toString() ?? "~";

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Util.getIconByString(weatherDescr, 100),
        const SizedBox(
          height: 16,
        ),
        Text(
          weatherDescr,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }
}
