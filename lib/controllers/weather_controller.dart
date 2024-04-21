import 'package:weather_mobile_engineer_test_1/models/weather_data_model.dart';
import 'package:weather_mobile_engineer_test_1/repositories/weather_repository.dart';

class WeatherController {
  late double lat;
  late double lon;
  late WeatherData weatherData;
  final repository = WeatherRepository();

  WeatherController({required this.lat, required this.lon});

  Future<WeatherData> getWeather() async {
    return await repository.fetchWeatherData(lat, lon);
  }
}