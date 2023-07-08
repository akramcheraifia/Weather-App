import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  String basedUrl = "http://api.weatherapi.com/v1";
  String apiKey = "5e1ca884ec2c44e3be792009230807";

  Future<WeatherModel> getWeather({required String cityName}) async {
    http.Response response = await http.get(
        Uri.parse("$basedUrl/forecast.json?key=$apiKey&q=$cityName&days=7"));
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    WeatherModel weatherModel = WeatherModel.fromJson(jsonData);
    return weatherModel;
  }
}
