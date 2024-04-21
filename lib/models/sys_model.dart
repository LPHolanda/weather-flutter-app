class Sys {
  late int? type;
  late int? id;
  late String? country;
  late int? sunrise;
  late int? sunset;
  late String? pod;

  Sys({
    this.type, 
    this.id, 
    this.country, 
    this.sunrise, 
    this.sunset,
    this.pod
  });

  Sys.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    country = json['country'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    pod = json['pod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['id'] = id;
    data['country'] = country;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    data['pod'] = pod;
    return data;
  }
}