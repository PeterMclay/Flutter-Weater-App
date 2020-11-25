import 'package:flutter/material.dart';
import 'package:weatherapp/constants.dart';

class CustomScrollViewWidget extends StatelessWidget {
  final List<Precipitation> entries = <Precipitation>[
    Precipitation(time: '12:00', percent: 10, icon: 25),
    Precipitation(time: '13:00', percent: 10, icon: 25),
    Precipitation(time: '14:00', percent: 25, icon: 25),
    Precipitation(time: '15:00', percent: 75, icon: 75),
    Precipitation(time: '16:00', percent: 80, icon: 100),
    Precipitation(time: '17:00', percent: 90, icon: 100),
    Precipitation(time: '18:00', percent: 80, icon: 100),
    Precipitation(time: '19:00', percent: 75, icon: 75),
    Precipitation(time: '20:00', percent: 50, icon: 50),
    Precipitation(time: '21:00', percent: 40, icon: 50),
    Precipitation(time: '22:00', percent: 10, icon: 25),
    Precipitation(time: '23:00', percent: 0, icon: 25),
    Precipitation(time: '24:00', percent: 0, icon: 25),
  ];

  final List<HourlyForcast> hourlyEntries = <HourlyForcast>[
    HourlyForcast(time: '12:00', weather: 'sunny', temp: 14),
    HourlyForcast(time: '13:00', weather: 'sunny', temp: 15),
    HourlyForcast(time: '14:00', weather: 'sunny', temp: 17),
    HourlyForcast(time: '15:00', weather: 'sunny', temp: 18),
    HourlyForcast(time: '16:00', weather: 'sunny', temp: 18),
    HourlyForcast(time: '17:00', weather: 'sunny', temp: 16),
    HourlyForcast(time: '18:00', weather: 'sunny', temp: 16),
    HourlyForcast(time: '19:00', weather: 'sunny', temp: 12),
    HourlyForcast(time: '20:00', weather: 'sunny', temp: 11),
    HourlyForcast(time: '21:00', weather: 'sunny', temp: 10),
    HourlyForcast(time: '22:00', weather: 'sunny', temp: 10),
    HourlyForcast(time: '23:00', weather: 'sunny', temp: 8),
    HourlyForcast(time: '24:00', weather: 'sunny', temp: 8),
  ];

  final List<Wind> windEntries = <Wind>[
    Wind(time: '12:00', speed: 5, windColor: 'Calm', direction: 'North East'),
    Wind(time: '13:00', speed: 10, windColor: 'Light', direction: 'East'),
    Wind(time: '14:00', speed: 14, windColor: 'Light', direction: 'East'),
    Wind(
        time: '15:00',
        speed: 20,
        windColor: 'Moderate',
        direction: 'North East'),
    Wind(
        time: '16:00',
        speed: 24,
        windColor: 'Moderate',
        direction: 'North East'),
    Wind(time: '17:00', speed: 29, windColor: 'Fresh', direction: 'North'),
    Wind(time: '18:00', speed: 31, windColor: 'Fresh', direction: 'North'),
    Wind(
        time: '19:00', speed: 38, windColor: 'Strong', direction: 'North West'),
    Wind(
        time: '20:00', speed: 39, windColor: 'Strong', direction: 'North West'),
    Wind(time: '21:00', speed: 41, windColor: 'Gale-force', direction: 'North'),
    Wind(
        time: '22:00',
        speed: 42,
        windColor: 'Gale-force',
        direction: 'North East'),
    Wind(time: '23:00', speed: 31, windColor: 'Fresh', direction: 'North East'),
    Wind(time: '24:00', speed: 20, windColor: 'Moderate', direction: 'East')
  ];

  String wind = 'Calm';
  String angle = 'North East';
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Color(0xFF2298da),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              textTheme: TextTheme(headline1: kLocationTextStyle),
              backgroundColor: Color(0xFF2298da),
              title: Text('Kingston, ON'),
              centerTitle: true,
              snap: false,
              floating: false,
              pinned: true,
              stretch: true,
              expandedHeight: 725,
              elevation: 0,
              shadowColor: null,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/sunny.png'),
                        fit: BoxFit.cover),
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 525),
                      Text('15°', style: kTemperatureTextStyle),
                      Text('Feels like 13°', style: kFeelsLikeTextStyle),
                    ],
                  ),
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                //margin: EdgeInsets.only(top: 5.0),
                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  // boxShadow: [
                  //   new BoxShadow(
                  //     color: Colors.white70,
                  //     blurRadius: 5.0,
                  //   )
                  // ],
                  color: Color(0xFFE6E6E5),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 4.0),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(2.0)),
                        color: Colors.grey[400],
                      ),
                      height: 2.0,
                      width: 80.0,
                    ),
                    SizedBox(height: 16.0),
                    Container(
                      child: SizedBox(
                        height: 115.0,
                        child: ListView.builder(
                          itemCount: hourlyEntries.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return hourlyEntries[index];
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Divider(
                      thickness: 1.0,
                    ),
                    Container(
                      child: Text('Current Details',
                          style: kBlackTextStyle, textAlign: TextAlign.left),
                    ),
                    SizedBox(height: 8.0),
                    Container(
                      child: CurrentDetails(
                        humidity: 72.0,
                        pressure: 1014,
                        visibility: 16,
                        uvIndex: 'low',
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Divider(
                      thickness: 1.0,
                    ),
                    Container(
                      child: Text('Precipitation',
                          style: kBlackTextStyle, textAlign: TextAlign.left),
                    ),
                    SizedBox(height: 8.0),
                    Container(
                      child: SizedBox(
                        height: 110.0,
                        child: ListView.builder(
                          itemCount: entries.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return entries[index];
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Divider(
                      thickness: 1.0,
                    ),
                    Container(
                      child: Text('Wind', style: kBlackTextStyle),
                    ),
                    SizedBox(height: 8.0),

                    ////////////////////////// WIND  ////////////////////////////////
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '4',
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 4.0),
                        Column(
                          children: <Widget>[
                            Transform.rotate(
                              angle: windAngle[angle],
                              child: Icon(
                                Icons.navigation,
                                color: windStrength[wind],
                                size: 18.0,
                              ),
                            ),
                            Text(
                              'km/h',
                              style: TextStyle(
                                  color: Color(0xFF5E5E5F), fontSize: 12.0),
                            ),
                          ],
                        ),
                        SizedBox(width: 16.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              wind,
                              style: kSmallBlackTextStyle,
                            ),
                            Text(
                              'From Southwest',
                              style: kGreyTextStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Container(
                      child: SizedBox(
                        height: 75.0,
                        child: ListView.builder(
                          itemCount: windEntries.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return windEntries[index];
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 8.0),

                    SizedBox(height: 180.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HourlyForcast extends StatelessWidget {
  String time, weather;
  double temp;
  HourlyForcast({this.time, this.weather, this.temp});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: <Widget>[
            Text(
              '$temp°C',
              style: TextStyle(
                  decoration: null,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
            ),
            SizedBox(height: 8.0),
            Image.asset('images/sunicon.png', width: 50, height: 50),
            SizedBox(height: 8.0),
            Text(
              '$time',
              style: kGreyTextStyle,
            ),
            SizedBox(width: 65),
          ],
        ),
        VerticalDivider(thickness: 1.0),
      ],
    );
  }
}

class Precipitation extends StatelessWidget {
  String time;
  int icon;
  int percent;
  Precipitation({this.time, this.icon, this.percent});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: <Widget>[
            Text(
              '$percent%',
              style: TextStyle(
                  decoration: null,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
            ),
            Text(
              '<1mm',
              style: TextStyle(
                  decoration: null,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 12),
            ),
            Image.asset('images/$icon.png', width: 50, height: 50),
            SizedBox(height: 4.0),
            Text(
              '$time',
              style: kGreyTextStyle,
            ),
            SizedBox(width: 65),
          ],
        ),
        VerticalDivider(thickness: 1.0),
      ],
    );
  }
}

class CurrentDetails extends StatelessWidget {
  double humidity, pressure, visibility;
  String uvIndex;
  CurrentDetails({this.humidity, this.pressure, this.visibility, this.uvIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Humidity', style: kGreyTextStyle),
                Text('$humidity%', style: kSmallBlackTextStyle),
              ],
            ),
            Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Pressure', style: kGreyTextStyle),
                Text('$pressure mb', style: kSmallBlackTextStyle),
              ],
            ),
          ],
        ),
        SizedBox(height: 5.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Visibility', style: kGreyTextStyle),
                Text('$visibility km', style: kSmallBlackTextStyle),
              ],
            ),
            Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('UV Index', style: kGreyTextStyle),
                Text('$uvIndex, 1', style: kSmallBlackTextStyle),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class Wind extends StatelessWidget {
  String time, windColor, direction;
  int speed;
  Wind({this.time, this.speed, this.direction, this.windColor});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: <Widget>[
            Text(
              '$speed km/h',
              style: TextStyle(
                  decoration: null,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
            ),
            SizedBox(height: 8.0),
            Transform.rotate(
              angle: windAngle[direction],
              child: Icon(
                Icons.navigation,
                color: windStrength[windColor],
                size: 24.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              '$time',
              style: kGreyTextStyle,
            ),
            SizedBox(width: 65),
          ],
        ),
        VerticalDivider(thickness: 1.0),
      ],
    );
  }
}
