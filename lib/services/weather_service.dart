import 'package:dio/dio.dart';
import '../model/weather.dart';

class WeatherService {
  final Dio _dio = Dio();
  final String _baseUrl = "https://api.openweathermap.org/data/2.5/onecall";
  final String _apiKey = "17a7d256dc83a5a925da30d70837769a";

  WeatherService() {
    _dio.options.headers['Content-Type'] = 'application/json';
  }

  Future<Weather> fetchWeather(
      {required double lat, required double lon}) async {
    try {
      final response = await _dio.get(_baseUrl, queryParameters: {
        'lat': lat,
        'lon': lon,
        'appid': _apiKey,
        'units': 'metric',
      });

      if (response.statusCode == 200) {
        return Weather.fromJson(response.data);
      } else {
        throw Exception("Failed to load weather data");
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        throw Exception("Unauthorized: Invalid API key");
      } else {
        throw Exception("Failed to load weather data: ${e.message}");
      }
    }
  }
}
