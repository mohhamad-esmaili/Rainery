import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rainery/models/weather_model.dart';
import 'package:rainery/service/weather_service.dart';

class WeatherProvider extends ChangeNotifier {
  bool _isLoading = true;
  var _todayWeather = [];
  double lat = 0;
  double long = 0;

  WeatherModel? _loadedWeather;
  Map<DateTime, List> _dailyWeather = {};
  final DateTime _nowTime = DateTime.now();

  WeatherProvider() {
    getLocation();
    setWeather();
  }

  set setLoading(bool newValue) => _isLoading = newValue;
  get getLoading => _isLoading;

  /// this getter will return today weather data
  /// this returns [List] of data like weatherCode
  get getWeather => _loadedWeather;
  get todayWeatherGetter {
    return _todayWeather;
  }

  setWeather() async {
    _loadedWeather = await WeatherService.getWeather(lat, long);
    fetchDayAndData();

    setLoading = false;

    notifyListeners();
  }

  /// this function combine several list into Map
  /// `key: DateTime` and value is `List[weatherCode,temperature2MMax,...]`
  /// this function set todayWeather value too
  void fetchDayAndData() {
    int index = 0;
    Daily dailyInstance = _loadedWeather!.daily;

    for (var day in dailyInstance.time) {
      _dailyWeather = {
        for (var catchedDay in dailyInstance.time)
          catchedDay: [
            dailyInstance.weathercode[index],
            dailyInstance.temperature2MMax[index],
            dailyInstance.temperature2MMin[index],
            dailyInstance.windspeed10MMax[index],
          ]
      };
      if (day.day == _nowTime.day) {
        _todayWeather = _dailyWeather[day] as List;
      }
      index += 1;
    }
  }

  getLocation() async {
    LocationPermission permission;
    // bool serviceEnabled;

    // serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // if (!serviceEnabled) {
    //   await Geolocator.requestPermission();
    //   return Future.error('Location services are disabled.');
    // }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        await Geolocator.requestPermission();
        SystemNavigator.pop();
        return Future.error('Location permissions are denied');
      }
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);

    lat = position.latitude;
    long = position.longitude;
  }
}
