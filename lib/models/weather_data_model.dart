import 'package:weather_mobile_engineer_test_1/models/clouds_model.dart';
import 'package:weather_mobile_engineer_test_1/models/coord_model.dart';
import 'package:weather_mobile_engineer_test_1/models/main_model.dart';
import 'package:weather_mobile_engineer_test_1/models/rain_model.dart';
import 'package:weather_mobile_engineer_test_1/models/snow_model.dart';
import 'package:weather_mobile_engineer_test_1/models/sys_model.dart';
import 'package:weather_mobile_engineer_test_1/models/weather_model.dart';
import 'package:weather_mobile_engineer_test_1/models/wind_model.dart';

class WeatherData {
  late List<Weather>? weather;
  late Coord? coord;
  late Main? main;
  late Rain? rain;
  late Snow? snow;
  late Wind? wind;
  late Clouds? clouds;
  late Sys? sys;
  late String? base;
  late int? visibility;
  late int? dt;
  late String? cod;
  late int? timezone;
  late int? id;
  late String? name;

  WeatherData({
    this.weather,
    this.coord,
    this.main,
    this.rain,
    this.snow,
    this.wind,
    this.clouds,
    this.sys,
    this.base,
    this.visibility,
    this.dt,
    this.cod,
    this.timezone,
    this.id,
    this.name,
  });

  WeatherData.fromJson(Map<String, dynamic> json) {
    weather = <Weather>[];
    json['weather']?.forEach((v) {
      weather?.add(Weather.fromJson(v));
    });
    coord = (json['coord'] != null ? Coord.fromJson(json['coord']) : null);
    main = (json['main'] != null ? Main.fromJson(json['main']) : null);
    rain = (json['rain'] != null ? Rain.fromJson(json['rain']) : null);
    snow = (json['snow'] != null ? Snow.fromJson(json['snow']) : null);
    wind = (json['wind'] != null ? Wind.fromJson(json['wind']) : null);
    clouds = (json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null);
    sys = (json['sys'] != null ? Sys.fromJson(json['sys']) : null);
    base = json['base'];
    visibility = json['visibility'];
    dt = json['dt'];
    timezone = json['timezone'];
    id = json['id'];
    name = json['name'];
    cod = json['cod'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['weather'] = weather?.map((v) => v.toJson()).toList();
    data['coord'] = coord?.toJson();
    data['main'] = main?.toJson();
    data['rain'] = rain?.toJson();
    data['snow'] = snow?.toJson();
    data['wind'] = wind?.toJson();
    data['clouds'] = clouds?.toJson();
    data['sys'] = sys?.toJson();
    data['base'] = base;
    data['visibility'] = visibility;
    data['dt'] = dt;
    data['timezone'] = timezone;
    data['id'] = id;
    data['name'] = name;
    data['cod'] = cod.toString();
    return data;
  }
}