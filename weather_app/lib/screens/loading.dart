import 'package:flutter/material.dart';
import 'package:weather_app/data/my_location.dart';
import 'package:weather_app/data/network.dart';
import 'package:weather_app/screens/weather_screen.dart';

const weatherApiKey = "338c40aad9d27b405ace0b0392aa59cc";

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
            onPressed: () {
              getLocation();
            },
            child: Text(
              'Get my location',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue),
      ),
    );
  }

  Future<void> getLocation() async {
    MyLocation myLocation = new MyLocation();
    await myLocation.getMyCurrentLocation();

    Network network = Network(
        'http://api.openweathermap.org/data/2.5/weather?lat=${myLocation.latitude}&lon=${myLocation.longitude}&appid=$weatherApiKey&units=metric',
        'http://api.openweathermap.org/data/2.5/air_pollution?lat=${myLocation.latitude}&lon=${myLocation.longitude}&appid=$weatherApiKey&units=metric');

    var weatherData = await network.getJsonData();
    var airData = await network.getAirData();
    print(
        "==============================[WeatherDataBegin]==============================");
    print(weatherData);
    print(
        "==============================[WeatherDataEnd]==============================");
    print(
        "==============================[AirDataBegin]==============================");
    print(airData);
    print(
        "==============================[AirDataEnd]==============================");
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherScreen(
        parseWeatherData: weatherData,
        parseAirPollutionData: airData,
      );
    }));
  }
}
