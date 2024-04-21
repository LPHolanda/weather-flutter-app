import 'package:weather_mobile_engineer_test_1/models/forecast_model.dart';
import 'package:weather_mobile_engineer_test_1/repositories/forecast_repository.dart';

class ForecastController {
  late double lat;
  late double lon;
  late Forecast forecastData;
  final repository = ForecastRepository();

  ForecastController({required this.lat, required this.lon});

  Future<Forecast> getForecast() async {
    return await repository.fetchForecastData(lat, lon);
  }
}