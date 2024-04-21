class Wind {
  late double speed;
  late int deg;
  late double? gust;

  Wind({required this.speed, required this.deg});

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'].toDouble();
    deg = json['deg'];
    gust = json['gust']?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['speed'] = speed.toDouble();
    data['deg'] = deg;
    data['gust'] = gust?.toDouble();
    return data;
  }
}