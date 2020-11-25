import 'package:flutter/material.dart';
import 'screens/main_screen.dart';
import 'screens/demo_screen.dart';

void main() {
  runApp(Weather());
}

class Weather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   home: CustomScrollViewWidget(),
    // );

    return MaterialApp(
      initialRoute: MainScreen.id,
      routes: {
        MainScreen.id: (context) => MainScreen(),
        DemoScreen.id: (context) => DemoScreen(),
      },
    );

    // return MaterialApp(
    //   initialRoute: HomeScreen.id,
    //   routes: {
    //     HomeScreen.id: (context) => HomeScreen(),
    //     BarChartSample3.id: (context) => BarChartSample3(),
    //   },
    // );
  }
}
