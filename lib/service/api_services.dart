import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_data.dart';

Future fetchWeather() async {
  String baseUrl = "https://api.openweathermap.org/data/2.5/weather";
  String lat = "7.436997111978136";
  String long = "3.9085499417790195";
  String apiKey = "e93726faed1ad8ec54e107b68723e5e3";

  final dio = Dio();

  try {
    final response = await dio.get(baseUrl, queryParameters: {
      "lat": lat,
      "lon": long,
      "appId": apiKey,
    });

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = response.data;
      final WeatherData weatherData = WeatherData.fromJson(responseData);

      return weatherData;
    }

    print(response.data);
  } catch (e) {
    print(e.toString());
  }
}
