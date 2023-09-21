import 'package:flutter/material.dart';
import 'package:weather_app/class/home_container.dart';
import 'package:weather_app/service/hourly_weather_services.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHourlyWeather();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('gvgvgvgg'),
      ),
    );
  }
}
