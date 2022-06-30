import 'package:flutter/material.dart';
import 'package:my_weather_app/model/weather_model.dart';
import 'package:my_weather_app/utils/weather_utils.dart';

class WeeklyWeather extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const WeeklyWeather(this.snapshot);

  @override
  Widget build(BuildContext context) {
    List<WeatherList>? weatherList = snapshot.data?.list;
    // String tempStr = weatherList?[index].main?.temp?.round().toString() ?? "~"

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: ListView.separated(
        itemBuilder: (context, index) => Container(
          width: MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.width / 3,
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  Util.getFormattedWeeklyDate(weatherList?[index].dt ?? 0),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Util.getIconByString(
                    weatherList?[index].weather?[0].main ?? "Sunny", 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      weatherList?[index].main?.temp?.round().toString() ?? "~",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      "°",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(
          width: 8,
        ),
        itemCount: snapshot.data?.list?.length ?? 0,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
