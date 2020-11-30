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
