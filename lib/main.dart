import 'package:flutter/material.dart';
import 'screens/main_screen.dart';

void main() {
  //runApp(RoutesWidget());
  runApp(Weather());
}

class Weather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   home: CustomScrollViewWidget(),
    // );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Nunito',
        textTheme: Theme.of(context).textTheme.apply(
              displayColor: Colors.white,
              bodyColor: Colors.white,
            ),
      ),
      initialRoute: MainScreen.id,
      routes: {
        '/': (_) => MainScreen(),
        '/search': (_) => CustomSearchScaffold(),
      },
    );
  }
}
