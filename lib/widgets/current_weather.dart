import 'package:flutter/material.dart';
import 'package:my_weather_app/model/weather_model.dart';
import 'package:my_weather_app/utils/weather_utils.dart';

class CurrentWeather extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const CurrentWeather(this.snapshot);

  @override
  Widget build(BuildContext context) {
    WeatherList? weatherList = snapshot.data?.list?[0];
    String tempStr = weatherList?.main?.temp?.round().toString() ?? "~";
    String tempMinStr = weatherList?.main?.tempMin?.round().toString() ?? "~";
    String tempMaxStr = weatherList?.main?.tempMax?.round().toString() ?? "~";
    String formattedDate = Util.getFormattedDate(weatherList?.dt ?? 0);

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "$tempStr°",
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(formattedDate, style: Theme.of(context).textTheme.headlineSmall),
              Row(
                children: [
                  Icon(Icons.arrow_downward),
                  Text(
                    tempMinStr,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Icon(Icons.arrow_upward),
                  Text(
                    tempMaxStr,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
