// To parse this JSON data, do
//
//     final cityResponse = cityResponseFromMap(jsonString);

import 'dart:convert';

import 'city.dart';

class CityResponse {
  CityResponse({
    required this.request,
    required this.response,
    required this.terms,
  });

  Request request;
  List<City> response;
  String terms;

  factory CityResponse.fromJson(String str) =>
      CityResponse.fromMap(json.decode(str));

  factory CityResponse.fromMap(Map<String, dynamic> json) => CityResponse(
        request: Request.fromMap(json["request"]),
        response: List<City>.from(json["response"].map((x) => City.fromMap(x))),
        terms: json["terms"],
      );
}

class Request {
  Request({
    required this.lang,
    required this.currency,
    required this.time,
    required this.id,
    required this.server,
    required this.host,
    required this.pid,
    required this.version,
    required this.method,
  });

  String lang;
  String currency;
  int time;
  String id;
  String server;
  String host;
  int pid;
  int version;
  String method;

  factory Request.fromJson(String str) => Request.fromMap(json.decode(str));

  factory Request.fromMap(Map<String, dynamic> json) => Request(
        lang: json["lang"],
        currency: json["currency"],
        time: json["time"],
        id: json["id"],
        server: json["server"],
        host: json["host"],
        pid: json["pid"],
        version: json["version"],
        method: json["method"],
      );
}
