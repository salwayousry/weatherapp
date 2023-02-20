import 'package:flutter/material.dart';
import 'package:weatherapp/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier{
  WeatherModel? _weatherData;

String?CityName;
set weatherData(WeatherModel?weather){
  _weatherData=weather;
  notifyListeners();
}
WeatherModel?get weatherData=>_weatherData;
}