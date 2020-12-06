import 'package:weatherapp/services/location.dart';
import 'package:weatherapp/services/networking.dart';
import 'package:intl/intl.dart';
import 'package:geocoder/geocoder.dart';
import 'package:weatherapp/services/keys.dart';

const apiKey = weatherKey;

class WeatherMethods {
  WeatherMethods({this.weatherData});
  dynamic weatherData;

  int getCurrentTemperature() {
    var temp = weatherData['current']['temp'];
    return temp.toInt();
  }
}

class WeatherData {
  dynamic weatherData;
  bool citySearch;
  double latitude, longitude;
  String address;
  WeatherData({this.citySearch, this.latitude, this.longitude});

  Future<dynamic> getLocationData() async {
    if (!citySearch) {
      Location location = Location();
      await location.getCurrentLocation();
      latitude = location.latitude;
      longitude = location.longitude;
    }
    Coordinates coordinates = Coordinates(latitude, longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    address = first.locality + ', ' + first.adminArea;
    print('locality = ${first.locality}');
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/onecall?lat=$latitude&lon=$longitude&exclude=minutely&appid=$apiKey&units=metric');
    weatherData = await networkHelper.getData();
    return weatherData;
  }

//Current Method
  String getAddress() {
    return address;
  }

  int getCurrentTemperature() {
    var temp = weatherData['current']['temp'];
    return temp.toInt();
  }

  int getCurrentFeelsLikeTemperature() {
    var feelsLikeTemp = weatherData['current']['feels_like'];
    return feelsLikeTemp.toInt();
  }

  int getCurrentCondition({String type, int index}) {
    int condition;
    if (type == 'daily') {
      condition = weatherData['daily'][index]['weather'][0]['id'];
    } else if (type == 'hourly') {
      condition = weatherData['hourly'][index]['weather'][0]['id'];
    } else {
      condition = weatherData['current']['weather'][0]['id'];
    }
    return condition;
  }

  String getCurrentBackground() {
    String id = weatherData['current']['weather'][0]['icon'];
    String icon;
    if (id.contains('01')) {
      if (id.contains('d')) {
        icon = 'ClearD';
      } else {
        icon = 'ClearN';
      }
    } else if (id.contains('03') || id.contains('02')) {
      if (id.contains('d')) {
        icon = 'PartlyCloudyD';
      } else {
        icon = 'PartlyCloudyD';
      }
    } else if (id.contains('04')) {
      if (id.contains('d')) {
        icon = 'CloudyD';
      } else {
        icon = 'CloudyD';
      }
    } else if (id.contains('13')) {
      if (id.contains('d')) {
        icon = 'SnowyD';
      } else {
        icon = 'SnowyN';
      }
    } else if (id.contains('09') || id.contains('10')) {
      if (id.contains('d')) {
        icon = 'RainyD';
      } else {
        icon = 'RainyN';
      }
    } else if (id.contains('11')) {
      icon = 'thunderstorm';
    } else {
      icon = 'RainyD';
    }
    return icon;
  }

  int getCurrentPressure() {
    var currentPressure = weatherData['current']['pressure'];
    return currentPressure.toInt();
  }

  int getCurrentHumidity() {
    var currentHumidity = weatherData['current']['humidity'];
    return currentHumidity.toInt();
  }

  int getCurrentDewPoint() {
    var currentDewPoint = weatherData['current']['dew_point'];
    return currentDewPoint.toInt();
  }

  int getCurrentUVI() {
    var currentUVI = weatherData['current']['uvi'];
    return currentUVI.toInt();
  }

  int getCurrentVisibility() {
    var currentVisibility = weatherData['current']['visibility'];
    currentVisibility = currentVisibility / 1000;
    return currentVisibility.toInt();
  }

  List getCurrentWindInfo() {
    var currentWindSpeed = weatherData['current']['wind_speed'];
    currentWindSpeed = (currentWindSpeed * 3600) / 1000;
    int windSpeed = currentWindSpeed.toInt();

    int currentWindAngle = weatherData['current']['wind_deg'];
    String currentWindDirection;
    if (currentWindAngle <= 20) {
      currentWindDirection = 'North';
    } else if (currentWindAngle > 20 && currentWindAngle < 70) {
      currentWindDirection = 'North East';
    } else if (currentWindAngle >= 70 && currentWindAngle <= 110) {
      currentWindDirection = 'East';
    } else if (currentWindAngle > 110 && currentWindAngle < 160) {
      currentWindDirection = 'South East';
    } else if (currentWindAngle >= 160 && currentWindAngle <= 200) {
      currentWindDirection = 'South';
    } else if (currentWindAngle > 200 && currentWindAngle < 250) {
      currentWindDirection = 'South West';
    } else if (currentWindAngle >= 250 && currentWindAngle <= 290) {
      currentWindDirection = 'West';
    } else if (currentWindAngle > 290 && currentWindAngle < 340) {
      currentWindDirection = 'North West';
    } else {
      currentWindDirection = 'North';
    }
    return [windSpeed, currentWindDirection];
  }

  String getCurrentTime() {
    int timeInMillis = weatherData['current']['dt'];
    var date = DateTime.fromMillisecondsSinceEpoch((timeInMillis) * 1000);
    var formattedCurrentTime = DateFormat.jm().format(date);
    return formattedCurrentTime;
  }

  List<String> getCurrentSunriseSunrset() {
    int timeInMillis = weatherData['current']['sunrise'];
    var date = DateTime.fromMillisecondsSinceEpoch((timeInMillis) * 1000);
    var formattedCurrentSunriseTime = DateFormat.jm().format(date);

    timeInMillis = weatherData['current']['sunset'];
    date = DateTime.fromMillisecondsSinceEpoch((timeInMillis) * 1000);
    var formattedCurrentSunsetTime = DateFormat.jm().format(date);

    List<String> sunsetSunriseTimes = [
      formattedCurrentSunriseTime,
      formattedCurrentSunsetTime
    ];
    return sunsetSunriseTimes;
  }

//Hourly and Daily Method
//type is 'hourly' or 'daily', index is hour or day
  int getFutureTemperature({String type, int index}) {
    var temp = weatherData['$type'][index]['temp'];
    return temp.toInt();
  }

  List<int> getDailyMinDay({int index}) {
    var min = weatherData['daily'][index]['temp']['min'];
    var day = weatherData['daily'][index]['temp']['day'];
    return [min.toInt(), day.toInt()];
  }

  String getFutureTime({String type, int index}) {
    if (type == 'hourly') {
      int timeInMillis = weatherData['$type'][index]['dt'];
      var date = DateTime.fromMillisecondsSinceEpoch((timeInMillis) * 1000);
      var formattedCurrentTime = DateFormat.jm().format(date);
      return formattedCurrentTime;
    } else {
      int timeInMillis = weatherData['$type'][index]['dt'];
      var date = DateTime.fromMillisecondsSinceEpoch((timeInMillis) * 1000);
      var formattedCurrentTime = DateFormat.MMMMEEEEd().format(date);
      return formattedCurrentTime;
    }
  }

  List getFutureWindInfo({int index}) {
    var currentWindSpeed = weatherData['hourly'][index]['wind_speed'];
    currentWindSpeed = (currentWindSpeed * 3600) / 1000;
    int windSpeed = currentWindSpeed.toInt();

    int currentWindAngle = weatherData['hourly'][index]['wind_deg'];
    String currentWindDirection;
    if (currentWindAngle <= 20) {
      currentWindDirection = 'North';
    } else if (currentWindAngle > 20 && currentWindAngle < 70) {
      currentWindDirection = 'North East';
    } else if (currentWindAngle >= 70 && currentWindAngle <= 110) {
      currentWindDirection = 'East';
    } else if (currentWindAngle > 110 && currentWindAngle < 160) {
      currentWindDirection = 'South East';
    } else if (currentWindAngle >= 160 && currentWindAngle <= 200) {
      currentWindDirection = 'South';
    } else if (currentWindAngle > 200 && currentWindAngle < 250) {
      currentWindDirection = 'South West';
    } else if (currentWindAngle >= 250 && currentWindAngle <= 290) {
      currentWindDirection = 'West';
    } else if (currentWindAngle > 290 && currentWindAngle < 340) {
      currentWindDirection = 'North West';
    } else {
      currentWindDirection = 'North';
    }
    return [windSpeed, currentWindDirection];
  }

  int getFuturePop({String type, int index}) {
    var pop = weatherData['$type'][index]['pop'];
    pop *= 100;
    return pop.toInt();
  }

  String getFutureIcon({String type, int index}) {
    String id = weatherData['$type'][index]['weather'][0]['icon'];
    String icon;
    if (id.contains('01')) {
      icon = 'clear_day';
    } else if (id.contains('03') || id.contains('02')) {
      icon = 'partly_cloudy_day';
    } else if (id.contains('04')) {
      icon = 'cloudy_day';
    } else if (id.contains('13')) {
      //icon = 'snowy_day';
      icon = 'rainy_day';
    } else if (id.contains('09') || id.contains('10')) {
      icon = 'rainy_day';
    } else if (id.contains('11')) {
      //icon = 'thunderstorm';
      icon = 'rainy_day';
    } else {
      //icon = 'foggy';
      icon = 'rainy_day';
    }
    return icon;
  }

  double getRainAmount({String type, int index}) {
    try {
      var rainAmount = weatherData['$type'][index]['rain']['1h'];
      return rainAmount;
    } catch (e) {
      return 0;
    }
  }

  double getSnowAmount(String type, int index) {
    try {
      var snowAmount = weatherData['$type'][index]['rain']['1h'];
      return snowAmount;
    } catch (e) {
      return 0;
    }
  }
}
