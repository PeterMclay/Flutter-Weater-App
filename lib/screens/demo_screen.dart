import 'package:flutter/material.dart';
import 'package:weatherapp/services/weather.dart';
import 'package:weatherapp/screens/main_screen.dart';

const apiKey = '4cb003be2dc2478379f40298c5b2c422';

class DemoScreen extends StatefulWidget {
  static const String id = 'demo_screen';
  @override
  _DemoScreenState createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  double latitude, longitude;
  int temperature;

  @override
  void initState() {
    super.initState();
    //getLocationData();
  }

  Future<bool> getLocationData() async {
    WeatherData weather = WeatherData();
    await weather.getLocationData();
    temperature = weather.getCurrentTemperature();
    print('$temperature');
    /*Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MainScreen(weatherData: weatherData);
    }));*/
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2298da),
      body: Center(
        child: FutureBuilder(
          future: getLocationData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(child: Text('$temperature'));
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
