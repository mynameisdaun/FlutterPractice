import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {

  WeatherScreen({this.parseWeatherData});

  final dynamic parseWeatherData;

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {

  String? cityName;
  int? temperature;


  @override
  void initState() {
    super.initState();
    updateData(widget.parseWeatherData);
    print(widget.parseWeatherData);
  }

  void updateData(dynamic weatherData) {
    setState(() {
      temperature = weatherData['main']['temp'].round();
      cityName = weatherData['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$cityName',
                style: TextStyle(
                  fontSize: 30.0
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                '$temperature',
                style: TextStyle(
                  fontSize: 30.0
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
