import 'package:flutter/material.dart';
import 'package:my_weather_app/screen/weather_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 100,
            fontWeight: FontWeight.w300,
          ),
          bodyLarge: TextStyle(

          )
        ),
      ),
      home: WeatherScreen(),
    );
  }
}
