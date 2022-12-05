import 'dart:convert';

class City {
  City({
    required this.name,
    required this.cityCode,
    required this.lat,
    required this.lng,
    required this.countryCode,
  });

  String name;
  String cityCode;
  double lat;
  double lng;
  String countryCode;

  factory City.fromJson(String str) => City.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory City.fromMap(Map<String, dynamic> json) => City(
        name: json["name"],
        cityCode: json["city_code"],
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
        countryCode: json["country_code"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "city_code": cityCode,
        "lat": lat,
        "lng": lng,
        "country_code": countryCode,
      };
}
