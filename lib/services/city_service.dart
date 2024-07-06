import 'package:dio/dio.dart';
import '../model/city.dart';

class CityService {
  final Dio _dio = Dio();
  final String _baseUrl = "https://api.openweathermap.org/geo/1.0/direct";
  final String _apiKey = "17a7d256dc83a5a925da30d70837769a";

  Future<List<City>> searchCities(String query) async {
    try {
      final response = await _dio.get(_baseUrl, queryParameters: {
        'q': query,
        'appid': _apiKey,
        'limit': 5,
      });

      print(response);

      if (response.statusCode == 200) {
        List<dynamic> citiesJson = response.data as List<dynamic>;
        return citiesJson.map((json) => City.fromJson(json)).toList();
      } else {
        throw Exception("Failed to search cities");
      }
    } catch (e) {
      throw Exception("Failed to search cities: ${e.toString()}");
    }
  }
}
