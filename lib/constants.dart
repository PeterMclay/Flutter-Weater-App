import 'package:flutter/material.dart';
import 'dart:math';

const kTemperatureTextStyle = TextStyle(
  fontSize: 70.0,
  //fontWeight: FontWeight.w600,
  color: Colors.white,
  fontFamily: 'Nunito',
);
const kFeelsLikeTextStyle = TextStyle(
  fontSize: 14.0,
  //fontWeight: FontWeight.w400,
  color: Color(0xFFEEEEEE),
  fontFamily: 'Nunito',
);

const kWhiteTextStyle = TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.w600,
  color: Colors.white,
  fontFamily: 'Nunito',
);

const windStrength = {
  'Calm': Colors.grey,
  'Light': Color(0xFF90CAF9),
  'Moderate': Colors.green,
  'Fresh': Colors.yellow,
  'Strong': Colors.orange,
  'Gale-force': Colors.red
};

const kColorDay = Color(0xFF6b56fd);
const kColorNight = Color(0xFF2E374D);

const kBackgroundColor = {
  'ClearD': Color(0xFF2298da),
  //'clear_night'
  'PartlyCloudyD': Color(0xFF2298da),
  //'partly_cloudy_night'
  'CloudyD': Color(0xFF8A8AA1),
  //'cloudy_night'
  'RainyD': Color(0xFF918DFF),
  //'rainy_night'
  //'snowy_day'
  //'snowy_night'
  //'thunderstorm_day'
  //'thunderstorm_night'
};

const windAngle = {
  'South': (0 * pi / 180),
  'South East': (45 * pi / 180),
  'East': (90 * pi / 180),
  'North East': (135 * pi / 180),
  'North': (180 * pi / 180),
  'North West': (225 * pi / 180),
  'West': (270 * pi / 180),
  'South West': (315 * pi / 180),
};

const kMainTextStyle = TextStyle(
  fontSize: 14,
  color: Color(0xFF5E5E5F),
  fontFamily: 'Nunito',
);

const kBlackTextStyle = TextStyle(
  fontSize: 14.0,
  fontFamily: 'Nunito',
  //fontWeight: FontWeight.w400,
);
const kGreyTextStyle = TextStyle(
  color: const Color(0xFF5E5E5F),
  fontFamily: 'Nunito',
);

//const kSmallBlackTextStyle = TextStyle(color: Colors.black);

const kTitleTextStyle = TextStyle(
  fontWeight: FontWeight.w600,
  fontFamily: 'Nunito',
);

const kWeatherCondition = {
  200: ['Thunderstorms with Light Showers', 'thunderstorm_and_rain'],
  201: ['Thunderstorms with Showers', 'thunderstorm_and_rain'],
  202: ['Thunderstorms with Heavy Showers', 'thunderstorm_and_rain'],
  210: ['Thunderstorms', 'thunderstorms'],
  211: ['Thunderstorms', 'thunderstorms'],
  212: ['Thunderstorms', 'thunderstorms'],
  221: ['Thunderstorms', 'thunderstorms'],
  230: ['Thunderstorms with Showers', 'thunderstorm_and_rain'],
  231: ['Thunderstorms with Showers', 'thunderstorm_and_rain'],
  232: ['Thunderstorms with Showers', 'thunderstorm_and_rain'],
  300: ['Light Showers', 'rain'],
  301: ['Showers', 'rain'],
  302: ['Heavy Showers', 'rain'],
  310: ['Light Showers', 'rain'],
  311: ['Heavy Showers', 'rain'],
  312: ['Showers', 'rain'],
  313: ['Showers', 'rain'],
  314: ['Heavy Showers', 'rain'],
  321: ['Showers', 'rain'],
  500: ['Light Showers', 'rain'],
  501: ['Showers', 'rain'],
  502: ['Heavy Showers', 'rain'],
  503: ['Heavy Showers', 'rain'],
  504: ['Heavy Showers', 'rain'],
  511: ['Freezing Rain', 'sleet'],
  520: ['Light Showers', 'rain'],
  521: ['Showers', 'rain'],
  522: ['Heavy Showers', 'rain'],
  531: ['Showers', 'rain'],
  600: ['Light Snow', 'snow'],
  601: ['Snowy', 'snow'],
  602: ['Heavy Snow', 'snow'],
  611: ['Sleet', 'sleet'],
  612: ['Sleet', 'sleet'],
  613: ['Sleet', 'sleet'],
  615: ['Sleet', 'sleet'],
  616: ['Sleet', 'sleet'],
  620: ['Light Snow Showers', 'snow'],
  621: ['Snow Showers', 'snow'],
  622: ['Heavy Snow Showers', 'snow'],
  701: ['Mist', 'rain'],
  711: ['Smokey', 'fog'],
  721: ['Hazey', 'fog'],
  731: ['Dusty', 'fog'],
  741: ['Foggy', 'fog'],
  751: ['Sandy', 'fog'],
  761: ['Dusty', 'fog'],
  762: ['Ashy', 'fog'],
  771: ['Squals', 'fog'],
  781: ['Tornado... RUN!', 'fog'],
  800: ['Clear', 'clear'],
  801: ['Partly Cloudy', 'partly_cloudy'],
  802: ['Partly Cloudy', 'partly_cloudy'],
  803: ['Cloudy', 'cloudy'],
  804: ['Cloudy', 'cloudy'],
};
