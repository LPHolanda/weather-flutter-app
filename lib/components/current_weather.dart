import 'package:flutter/material.dart';
import 'package:weather_mobile_engineer_test_1/controllers/weather_controller.dart';
import 'package:weather_mobile_engineer_test_1/models/weather_data_model.dart';

class CurrentWeatherWidget extends StatefulWidget {
  const CurrentWeatherWidget({super.key, required this.lat, required this.lon});

  final double lat;
  final double lon;

  @override
  State<CurrentWeatherWidget> createState() => CurrentWeatherState();
}

class CurrentWeatherState extends State<CurrentWeatherWidget> {

  late Future<WeatherData> futureWeatherData;

  @override
  void initState() {
    super.initState();
    futureWeatherData = WeatherController(lat: widget.lat, lon: widget.lon).getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.inversePrimary,
      child: Center(
        child: FutureBuilder<WeatherData>(
          future: futureWeatherData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: Text(
                          '${(snapshot.data!.main?.temp as double).toInt()}°',
                          style: const TextStyle(fontSize: 50, color: Colors.white),
                        )
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: Text(
                          snapshot.data!.weather![0].description,
                          style: const TextStyle(fontSize: 12, color: Colors.white),
                        )
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: Image.network('https://openweathermap.org/img/wn/${snapshot.data!.weather![0].icon}@2x.png')
                  )
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        )
      ),
    );
  }
}
