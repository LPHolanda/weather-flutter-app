import 'package:flutter/material.dart';

import 'package:weather_mobile_engineer_test_1/components/current_weather.dart';
import 'package:weather_mobile_engineer_test_1/components/forecast_weather.dart';
import 'package:weather_mobile_engineer_test_1/models/city_screen_arguments.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {

  late CityScreenArguments cityScreenArguments = ModalRoute.of(context)!.settings.arguments as CityScreenArguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text.rich(
          textDirection: TextDirection.ltr,
          TextSpan(
            text: cityScreenArguments.name,
            children: const [
              WidgetSpan(child: Icon(Icons.location_pin))
            ]
          )
        )
      ),
      body: Center(
        child: Column(
          children: [
            CurrentWeatherWidget(
              lat: cityScreenArguments.lat, 
              lon: cityScreenArguments.lon
            ),
            ForecastWeatherWidget(
              lat: cityScreenArguments.lat, 
              lon: cityScreenArguments.lon
            )
          ]
        )
      ),
    );
  }
}
