import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/city.dart';
import '../services/city_service.dart';

class CityProvider with ChangeNotifier {
  final CityService _cityService = CityService();
  List<City>? _cities;
  List<City> _previousCities = [];
  bool _isLoading = false;
  SharedPreferences? _prefs;

  CityProvider() {
    _loadPrefs();
  }

  Future<void> _loadPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  List<City>? get cities => _cities;
  List<City> get previousCities => _previousCities;
  bool get isLoading => _isLoading;

  Future<void> searchCity(String cityName) async {
    _isLoading = false;
    notifyListeners();

    try {
      _cities = await _cityService.searchCities(cityName);

      if (_cities != null && _cities!.isNotEmpty) {
        _updatePreviousCities(_cities!.first);
      }
    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void _updatePreviousCities(City city) {
    if (!_previousCities.contains(city)) {
      _previousCities.add(city);
      _savePreviousCities();
    }
  }

  Future<void> _savePreviousCities() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    List<String> cityList =
        _previousCities.map((city) => json.encode(city.toJson())).toList();
    await _prefs.setStringList('previousCities', cityList);
  }

  Future<void> getPreviousCities() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    List<String>? cityList = _prefs.getStringList('previousCities');
    if (cityList != null) {
      _previousCities = cityList
          .map((cityJson) => City.fromJson(json.decode(cityJson)))
          .toList();
    }
    notifyListeners();
  }
}
