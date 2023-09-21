import 'package:flutter/material.dart';
import 'package:weather_app/class/custom_container.dart';

class WeatherList extends StatefulWidget {
  const WeatherList({super.key});

  @override
  State<WeatherList> createState() => _WeatherListState();
}

class _WeatherListState extends State<WeatherList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0XFF2E335A),
        appBar: AppBar(
          backgroundColor: const Color(0XFF2E335A),
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.grey,
                ),
              ),
              const Text(
                "Weather",
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white)),
                child: const Icon(
                  Icons.more_horiz_outlined,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  isDense: true,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  hintText: "Search for a city or airport",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0XFF1C1B33),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0XFF1C1B33)),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomContainer(),
              const SizedBox(
                height: 20,
              ),
              const CustomContainer(),
              const SizedBox(
                height: 20,
              ),
              const CustomContainer(),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
