import 'package:flutter/material.dart';
import 'package:weather_app/class/home_container.dart';
import 'package:weather_app/models/weather_data.dart';
import 'package:weather_app/pages/weather_list.dart';
import 'package:weather_app/service/api_services.dart';
import 'package:weather_app/service/hourly_weather_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchWeather();
    toCelsius(32);
    getHourlyWeather();
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: fetchWeather(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              final WeatherData weather = snapshot.data;
              var temperature = toCelsius(weather.main.temp);
              print(temperature);
              return Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.asset(
                    'assets/bg.png',
                    fit: BoxFit.cover,
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Text(
                              weather.name.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "${temperature.toStringAsFixed(0)}°C",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              weather.weather.first.description,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 149, 144, 144),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "H: ${weather.main.humidity.toString()}°",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "L: ${weather.coord.lat.toStringAsFixed(1)}°",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        'assets/house.png',
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 350,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0XFF2E335A), Color(0XFF1C1B33)],
                          // stops: [26.0, 26.0],
                        ),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                      ),
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Container(
                                  height: 5,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: const Color(0XFF48319D),
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        "Hourly Forecast",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Color.fromARGB(
                                                255, 111, 105, 105)),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        "Weekly Forecast",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Color.fromARGB(
                                                255, 111, 105, 105)),
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(
                                  color: Color.fromARGB(255, 158, 138, 138),
                                  height: 0,
                                  thickness: 0.2,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    HomeContainer(),
                                    HomeContainer(),
                                    HomeContainer(),
                                    HomeContainer(),
                                    HomeContainer(),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      GestureDetector(
                                        child: Image.asset(
                                          'assets/Map.png',
                                        ),
                                      ),
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/Subtract.png',
                                          ),
                                          Center(
                                            child: Container(
                                              height: 65,
                                              width: 65,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white,
                                              ),
                                              child: const Center(
                                                child: Icon(
                                                  Icons.add,
                                                  size: 39,
                                                  color: Color(0XFF48319D),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      const WeatherList()));
                                        },
                                        child: Image.asset(
                                          'assets/Symbol.png',
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else {
              print("follow me");
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }

  double toCelsius(double alex) {
    double farenhit = alex;
    double celsius = (farenhit - 32) * 5 / 9;

    return celsius;
  }
}
