import 'package:flutter/material.dart';
import 'dart:math';

const kTemperatureTextStyle = TextStyle(
  fontSize: 40.0,
  fontWeight: FontWeight.w600,
  color: Colors.white,
);
const kFeelsLikeTextStyle = TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.w400,
  color: Colors.white,
);

const windStrength = {
  'Calm': Colors.grey,
  'Light': Color(0xFF90CAF9),
  'Moderate': Colors.green,
  'Fresh': Colors.yellow,
  'Strong': Colors.orange,
  'Gale-force': Colors.red
};

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

const kMainTextStyle = TextStyle(fontSize: 14, color: Color(0xFF5E5E5F));

const kBlackTextStyle = TextStyle(
  fontSize: 14.0,
  //fontWeight: FontWeight.w400,
);
const kGreyTextStyle = TextStyle(color: const Color(0xFF5E5E5F));

//const kSmallBlackTextStyle = TextStyle(color: Colors.black);

const kTitleTextStyle = TextStyle(fontWeight: FontWeight.w600);

const kWeatherCondition = {
  200: 'Thunderstorms with Light Showers',
  201: 'Thunderstorms with Showers',
  202: 'Thunderstorms with Heavy Showers',
  210: 'Thunderstorms',
  211: 'Thunderstorms',
  212: 'Thunderstorms',
  221: 'Thunderstorms',
  230: 'Thunderstorms with Showers',
  231: 'Thunderstorms with Showers',
  232: 'Thunderstorms with Showers',
  300: 'Light Showers',
  301: 'Showers',
  302: 'Heavy Showers',
  310: 'Light Showers',
  311: 'Heavy Showers',
  312: 'Showers',
  313: 'Showers',
  314: 'Heavy Showers',
  321: 'Showers',
  500: 'Light Showers',
  501: 'Showers',
  502: 'Heavy Showers',
  503: 'Heavy Showers',
  504: 'Heavy Showers',
  511: 'Freezing Rain',
  520: 'Light Showers',
  521: 'Showers',
  522: 'Heavy Showers',
  531: 'Showers',
  600: 'Light Snow',
  601: 'Snowy',
  602: 'Heavy Snow',
  611: 'Sleet',
  612: 'Sleet',
  613: 'Sleet',
  615: 'Sleet',
  616: 'Sleet',
  620: 'Light Snow Showers',
  621: 'Snow Showers',
  622: 'Heavy Snow Showers',
  701: 'Misty',
  711: 'Smokey',
  721: 'Hazey',
  731: 'Dusty',
  741: 'Foggy',
  751: 'Sandy',
  761: 'Dusty',
  762: 'Ashy',
  771: 'Squals',
  781: 'Tornado... RUN!',
  800: 'Clear',
  801: 'Partly Cloudy',
  802: 'Partly Cloudy',
  803: 'Cloudy',
  804: 'Cloudy',
};
