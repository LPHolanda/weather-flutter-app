import 'package:flutter/material.dart';
import 'package:weather_mobile_engineer_test_1/controllers/forecast_controller.dart';
import 'package:weather_mobile_engineer_test_1/controllers/forecast_next_days_controller.dart';
import 'package:weather_mobile_engineer_test_1/models/forecast_model.dart';

class ForecastWeatherWidget extends StatefulWidget {
  const ForecastWeatherWidget({super.key, required this.lat, required this.lon});

  final double lat;
  final double lon;

  @override
  State<ForecastWeatherWidget> createState() => _ForecastWeatherState();
}

class _ForecastWeatherState extends State<ForecastWeatherWidget> {

  late Future<Forecast> futureForecast;

  final List<double> maxTempList = [];
  final List<double> minTempList = [];

  @override
  void initState() {
    super.initState();
      futureForecast = ForecastController(lat: widget.lat, lon: widget.lon).getForecast();
      setNextDaysTemp(futureForecast, maxTempList, minTempList);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.inversePrimary,
      child: Center(
        child: FutureBuilder(
          future: futureForecast,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Divider(
                    color: Colors.white,
                    height: 1,
                  ),
                ),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12, bottom: 8, top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          index == 0 ? 'Tomorrow' : 'In ${index + 1} days',
                          style: const TextStyle(color: Colors.white),
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Image.network('https://openweathermap.org/img/wn/${snapshot.data!.list![index].weather![0].icon}.png'),
                                Text(
                                  '${maxTempList[index].toInt()}',
                                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  '${minTempList[index].toInt()}',
                                  style: const TextStyle(fontWeight: FontWeight.normal, color: Colors.white)
                                )
                              ],
                            )
                          ]
                        )
                      ],
                    )
                  );
                },
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
