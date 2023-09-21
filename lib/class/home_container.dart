import 'package:flutter/material.dart';
import 'package:weather_app/models/hourly_weather_data.dart';
import 'package:weather_app/service/hourly_weather_services.dart';

class HomeContainer extends StatefulWidget {
  const HomeContainer({super.key});

  @override
  State<HomeContainer> createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getHourlyWeather(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          final ForecastResponse weather = snapshot.data;

          return ListView.builder(
            itemCount: weather.list.length,
            itemBuilder: (BuildContext context, int index) {
              final singleWeather = weather.list[index];
              print(singleWeather);
              return Container(
                height: 135,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color.fromRGBO(72, 49, 157, 1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      singleWeather.main.temp.toString(),
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Text(
                      "19°",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              );
            },
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
