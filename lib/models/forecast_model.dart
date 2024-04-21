import 'package:weather_mobile_engineer_test_1/models/city_model.dart';
import 'package:weather_mobile_engineer_test_1/models/forecast_list_model.dart';

class Forecast {
  String? cod;
  int? message;
  int? cnt;
  List<ForecastList>? list;
  City? city;

  Forecast({
    this.cod, 
    this.message, 
    this.cnt, 
    this.list, 
    this.city
  });

  Forecast.fromJson(Map<String, dynamic> json) {
    cod = json['cod'];
    message = json['message'];
    cnt = json['cnt'];
    if (json['list'] != null) {
      list = <ForecastList>[];
      json['list'].forEach((v) {
        list!.add(ForecastList.fromJson(v));
      });
    }
    city = json['city'] != null ? City.fromJson(json['city']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cod'] = cod;
    data['message'] = message;
    data['cnt'] = cnt;
    if (list != null) {
      data['list'] = list!.map((v) => v.toJson()).toList();
    }
    if (city != null) {
      data['city'] = city!.toJson();
    }
    return data;
  }
}