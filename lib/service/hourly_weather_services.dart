import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/hourly_weather_data.dart';

Future getHourlyWeather() async {
  String baseUrl = "https://api.openweathermap.org/data/2.5/weather";
  String lat = "7.436997111978136";
  String lon = "3.9085499417790195";
  String appid = "e93726faed1ad8ec54e107b68723e5e3";

  final dio = Dio();

  try {
    final response = await dio.get(baseUrl, queryParameters: {
      "lat": lat,
      "lon": lon,
      "appid": appid,
    });
    // print(response.data);

    if (response.statusCode == 200) {
      final Map<String, dynamic> hourlyData = response.data;
      final ForecastResponse forecastResponse =
          ForecastResponse.fromJson(hourlyData);
      debugPrint(response.data.toString());

      return forecastResponse;
    }
  } catch (e) {
    print(e.toString());
  }
}
