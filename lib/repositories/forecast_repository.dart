import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:weather_mobile_engineer_test_1/models/forecast_model.dart';

class ForecastRepository {
  late Dio dio = Dio();

  Future<Forecast> fetchForecastData(double lat, double lon) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    late Response response;

    try {
      response = await dio
        .get('https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&lang=en&units=metric&appid=073113b0a1e6c311e374fb32cd2793ff');
    } catch(e) {
      try {
        return Forecast.fromJson(jsonDecode(prefs.getString('forecast$lat$lon') ?? '') as Map<String, dynamic>);
      } catch(e) {
        throw Exception('Failed to load forecast data from SharedPreferences');
      }
    }   
    
    if (response.statusCode == 200) {
      prefs.setString('forecast$lat$lon', jsonEncode(response.data));
      return Forecast.fromJson(response.data);
    } else {
      throw Exception('Failed to load Forecast');
    }
  }
}