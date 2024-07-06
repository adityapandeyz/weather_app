import 'package:flutter/material.dart';
import 'package:weather_app_go_india_stocks/services/weather_service.dart';

import '../model/weather.dart';

class WeatherProvider with ChangeNotifier {
  final WeatherService _weatherService = WeatherService();
  Weather? _weather;
  bool _isLoading = false;

  Weather? get weather => _weather;
  bool get isLoading => _isLoading;

  Future<void> fetchWeather(double lat, double lon) async {
    _isLoading = false;
    notifyListeners();

    try {
      _weather = await _weatherService.fetchWeather(lat: lat, lon: lon);
    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
