import 'package:weather_mobile_engineer_test_1/models/clouds_model.dart';
import 'package:weather_mobile_engineer_test_1/models/main_model.dart';
import 'package:weather_mobile_engineer_test_1/models/rain_model.dart';
import 'package:weather_mobile_engineer_test_1/models/sys_model.dart';
import 'package:weather_mobile_engineer_test_1/models/weather_model.dart';
import 'package:weather_mobile_engineer_test_1/models/wind_model.dart';

class ForecastList {
  late int? dt;
  late Main? main;
  late List<Weather>? weather;
  late Clouds? clouds;
  late Wind? wind;
  late int? visibility;
  late double? pop;
  late Rain? rain;
  late Sys? sys;
  late String? dtTxt;

  ForecastList({
    this.dt,
    this.main,
    this.weather,
    this.clouds,
    this.wind,
    this.visibility,
    this.pop,
    this.rain,
    this.sys,
    this.dtTxt
  });

  ForecastList.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    main = json['main'] != null ? Main.fromJson(json['main']) : null;
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
    clouds =
        json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null;
    wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
    visibility = json['visibility'];
    pop = json['pop']!.toDouble();
    rain = json['rain'] != null ? Rain.fromJson(json['rain']) : null;
    sys = json['sys'] != null ? Sys.fromJson(json['sys']) : null;
    dtTxt = json['dt_txt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dt'] = dt;
    if (main != null) {
      data['main'] = main!.toJson();
    }
    if (weather != null) {
      data['weather'] = weather!.map((v) => v.toJson()).toList();
    }
    if (clouds != null) {
      data['clouds'] = clouds!.toJson();
    }
    if (wind != null) {
      data['wind'] = wind!.toJson();
    }
    data['visibility'] = visibility;
    data['pop'] = pop!.toDouble();
    if (rain != null) {
      data['rain'] = rain!.toJson();
    }
    if (sys != null) {
      data['sys'] = sys!.toJson();
    }
    data['dt_txt'] = dtTxt;
    return data;
  }
}