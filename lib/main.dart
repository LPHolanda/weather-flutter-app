import 'package:flutter/material.dart';
import 'package:weather_mobile_engineer_test_1/views/home_page.dart';
import 'package:weather_mobile_engineer_test_1/views/weather_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Weather Mobile Engineer Test',
      theme: ThemeData(
        colorScheme : ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'ROCK THAT WEATHER'),
      routes: {
        '/weather' : (context) => const WeatherPage()
      },
    );
  }
}