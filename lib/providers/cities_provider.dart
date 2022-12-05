import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:w2w_app/models/city_response.dart';

class CitiesProvider extends ChangeNotifier {
  String _baseUrl = 'airlabs.co';
  String _apiKey = '76c6ffec-2649-474b-85d0-94f434004172';
  String _cityCode = '';

  CitiesProvider() {
    this.getCities();
  }

  getCities() async {
    var url = Uri.https(_baseUrl, '/api/v9/cities',
        {'api_key': _apiKey, 'city_code': _cityCode});

    final response = await http.get(url);
    final cityResponse = CityResponse.fromJson(response.body);
    print(cityResponse.response[0].name);
  }
}
