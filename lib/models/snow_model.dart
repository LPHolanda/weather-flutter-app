class Snow {
  late double? hour1;
  late double? hour3;
  
  Snow({this.hour1, this.hour3});

  Snow.fromJson(Map<String, dynamic> json) {
    hour1 = json['1h']?.toDouble();
    hour3 = json['3h']?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['1h'] = hour1?.toDouble();
    data['3h'] = hour3?.toDouble();
    return data;
  }
}