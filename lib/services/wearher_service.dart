import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/models/weather_model.dart';
class WeatherServices{
  String baseUrl='http://api.weatherapi.com/v1';
  String apiKey='4eb278f7fa8f4769971175353231802';
  Future<WeatherModel> getWeather({required String CityName})async{
 Uri url=Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$CityName&days=7');
 http.Response response=await http.get(url);
 Map<String,dynamic>data=jsonDecode(response.body);
 WeatherModel weather=WeatherModel.fromJson(data);
return weather;

  }
}