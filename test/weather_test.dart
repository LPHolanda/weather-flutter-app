import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_mobile_engineer_test_1/models/weather_data_model.dart';
import 'package:weather_mobile_engineer_test_1/repositories/weather_repository.dart';

import 'weather_test.mocks.dart';

@GenerateNiceMocks([MockSpec<WeatherRepository>()])
void main() {
  final data = WeatherData();
  final mockRepository = MockWeatherRepository();
  
  test("WeatherRepository returns a WeatherData type", () async {
    when(mockRepository.fetchWeatherData(any, any))
      .thenAnswer((_) async => data);

    final response = await mockRepository.fetchWeatherData(-23.5523, -46.6313);
    expect(response, isA<WeatherData>());
    expect(response, data);
  });


  test("Weather API returns a WeatherData type", () async {
    var apiResponse = WeatherData.fromJson(jsonDecode(jsonResponse) as Map<String, dynamic>);
    
    when(mockRepository.fetchWeatherData(any, any))
      .thenAnswer((_) async => apiResponse);

    final response = await mockRepository.fetchWeatherData(-23.5523, -46.6313);
    expect(response.name, 'Liberdade');
    expect(response.sys!.country, 'BR');
  });
}


String jsonResponse = '''
{"coord":{"lon":-46.6313,"lat":-23.5523},"weather":[{"id":500,"main":"Rain","description":"chuva leve","icon":"10d"}],"base":"stations","main":{"temp":25.87,"feels_like":26.16,"temp_min":25.73,"temp_max":26.19,"pressure":1017,"humidity":63},"visibility":10000,"wind":{"speed":1.03,"deg":0},"rain":{"1h":0.33},"clouds":{"all":0},"dt":1713115144,"sys":{"type":1,"id":8394,"country":"BR","sunrise":1713086383,"sunset":1713127993},"timezone":-10800,"id":3458611,"name":"Liberdade","cod":200}
''';