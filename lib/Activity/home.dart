import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:weather_icons/weather_icons.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var cityName = [
      "Greater Noida",
      "Noida",
      "Shamli",
      "Delhi",
      "Mumbai",
      "Kolkata"
    ];
    final random = Random();
    var city = cityName[random.nextInt(cityName.length)];
    final Map info = ModalRoute.of(context)?.settings.arguments as Map? ?? {};
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: GradientAppBar(
          gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [Colors.teal, Colors.orange]),
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Colors.orange,
                Colors.teal,
              ])),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                margin:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          String searchValue = searchController.text
                              .trim(); // Trim leading and trailing spaces
                          if (searchValue.isEmpty) {
                            print("Empty search");
                          } else {
                            Navigator.pushReplacementNamed(context, '/loading',
                                arguments: {"search_value": searchValue});
                          }
                        },
                        child: const Icon(
                          Icons.search,
                          color: Colors.blue,
                        )),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: "Search $city",
                          border: InputBorder.none,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(5),
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white.withOpacity(0.5),
                      ),
                      child: Row(
                        children: [
                          Image.network(
                            "https://openweathermap.org/img/wn/11n@2x.png"
                                .trim(), // Trimming the URL
                            errorBuilder: (context, error, stackTrace) {
                              return const Text('Error loading image');
                            },
                          ),
                          Column(
                            children: [
                              Text(
                                "${info["des_value"]}",
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${info['city_value']}",
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(5),
                      height: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white.withOpacity(0.5),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Icon(
                            WeatherIcons.thermometer,
                            size: 40,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${info['tem_value']}",
                                style: const TextStyle(
                                    fontSize: 60, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                "C",
                                style: TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(5),
                      height: 190,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white.withOpacity(0.5),
                      ),
                      child: Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                WeatherIcons.wind_deg_0,
                                size: 40,
                              ),
                            ],
                          ),
                          const Text("Wind Speed"),
                          Text(
                            "${info['air_value']}",
                            style: const TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                          const Text("Km/hr")
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(5),
                      height: 190,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white.withOpacity(0.5),
                      ),
                      child: Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                WeatherIcons.humidity,
                                size: 40,
                              ),
                            ],
                          ),
                          const Text("Humidity"),
                          Text(
                            "${info['hum_value']}",
                            style: const TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                          const Text("percent")
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Created By Mohit",
                style: TextStyle(fontSize: 16),
              ),
              const Text(
                "Data Provide By Open wheater Api.",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
