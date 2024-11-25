class ApiResponse {
  Location? location;
  Current? current;

  ApiResponse({this.location, this.current});

  ApiResponse.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? Location.fromJson(json['location'])
        : null;
    current = json['current'] != null
        ? Current.fromJson(json['current'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    if (this.current != null) {
      data['current'] = this.current!.toJson();
    }
    return data;
  }
}

class Location {
  String? name;
  String? country;
  String? localtime;

  Location({this.name, this.country, this.localtime});

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    country = json['country'];
    localtime = json['localtime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['country'] = this.country;
    data['localtime'] = this.localtime;
    return data;
  }
}

class Current {
  double? tempC;  // Temperature can be decimal (double)
  double? isDay;  // Can be 1 or 0, but we cast to double for flexibility
  Condition? condition;
  double? windKph;  // Wind speed in kph, could be a double
  double? precipMm;  // Precipitation in mm, could be a decimal (double)
  double? humidity;  // Humidity percentage, might return as int or double
  double? uv;  // UV index, could return as an int or double

  Current({
    this.tempC,
    this.isDay,
    this.condition,
    this.windKph,
    this.precipMm,
    this.humidity,
    this.uv,
  });

  Current.fromJson(Map<String, dynamic> json) {
    tempC = _parseDouble(json['temp_c']);
    isDay = _parseDouble(json['is_day']);
    condition = json['condition'] != null
        ? Condition.fromJson(json['condition'])
        : null;
    windKph = _parseDouble(json['wind_kph']);
    precipMm = _parseDouble(json['precip_mm']);
    humidity = _parseDouble(json['humidity']);
    uv = _parseDouble(json['uv']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['temp_c'] = this.tempC;
    data['is_day'] = this.isDay;
    if (this.condition != null) {
      data['condition'] = this.condition!.toJson();
    }
    data['wind_kph'] = this.windKph;
    data['precip_mm'] = this.precipMm;
    data['humidity'] = this.humidity;
    data['uv'] = this.uv;
    return data;
  }

  // Helper function to parse data as double, handles both int and double
  double? _parseDouble(dynamic value) {
    if (value is int) {
      return value.toDouble();
    } else if (value is double) {
      return value;
    }
    return null;
  }
}

class Condition {
  String? text;
  String? icon;
  int? code;

  Condition({this.text, this.icon, this.code});

  Condition.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    icon = json['icon'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['text'] = this.text;
    data['icon'] = this.icon;
    data['code'] = this.code;
    return data;
  }
}
