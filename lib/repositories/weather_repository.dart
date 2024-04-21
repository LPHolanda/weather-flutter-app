import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:weather_mobile_engineer_test_1/models/weather_data_model.dart';

class WeatherRepository {
  late Dio dio = Dio();

  Future<WeatherData> fetchWeatherData(double lat, double lon) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    late Response response;

    try {
      response = await dio
        .get('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&lang=en&units=metric&appid=073113b0a1e6c311e374fb32cd2793ff');
    } catch(e) {
      try {
        return WeatherData.fromJson(jsonDecode(prefs.getString('weather$lat$lon') ?? '') as Map<String, dynamic>);
      } catch(e) {
        throw Exception('Failed to load weather data from SharedPreferences');
      }
    }
    
    if (response.statusCode == 200) {
      prefs.setString('weather$lat$lon', jsonEncode(response.data));
      return WeatherData.fromJson(response.data);

    } else {
      throw Exception('Failed to load Weather');
    }
  }
}