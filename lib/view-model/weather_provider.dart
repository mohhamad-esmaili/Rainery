import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rainery/models/country_model.dart';
import 'package:rainery/models/weather_model.dart';
import 'package:rainery/models/weathercode_model.dart';
import 'package:rainery/service/weather_service.dart';
import 'package:rainery/utils/country_constants.dart';
import 'package:rainery/utils/weathercode_constants.dart';

class WeatherProvider extends ChangeNotifier {
  bool _isLoading = true;
  var _todayWeather = [];
  double _lat = 0;
  double _long = 0;

  WeatherModel? _loadedWeather;
  Map<DateTime, List> _dailyWeather = {};
  final List _hourlyWeather = [];

  List<CountryModel> _searchedListCountries = countriesConstants;

  WeatherProvider() {
    setWeather();
  }
  get hourlyWeather => _hourlyWeather;
  set setLoading(bool newValue) => _isLoading = newValue;
  get getLoading => _isLoading;
  get searchedListCountries => _searchedListCountries;

  /// this getter will return today weather data
  /// this returns [List] of data like weatherCode
  get getWeather => _loadedWeather;
  get todayWeather {
    return _todayWeather;
  }

  setWeather() async {
    await getLocation();
    _loadedWeather = await WeatherService.getWeather(_lat, _long);
    fetchDayAndData();

    setLoading = false;

    notifyListeners();
  }

  /// this function combine several list into Map
  /// `key: DateTime` and value is `List[weatherCode,temperature2MMax,...]`
  /// this function set todayWeather value too
  void fetchDayAndData() {
    int dayIndex = 0;
    int hourIndex = 0;
    final DateTime nowTime = DateTime.now();
    Daily dailyInstance = _loadedWeather!.daily;
    Hourly hourlyInstance = _loadedWeather!.hourly;

    for (var hour in hourlyInstance.time) {
      DateTime parsedHour = DateTime.parse(hour);
      if (parsedHour.day == nowTime.day) {
        _hourlyWeather.add([
          parsedHour,
          hourlyInstance.temperature2M[hourIndex],
          hourlyInstance.weathercode[hourIndex]
        ]);
        // _hourlyWeather = {
        //   parsedHour: [
        //     hourlyInstance.temperature2M[hourIndex],
        //     hourlyInstance.weathercode[hourIndex]
        //   ]
        // };
      }
      hourIndex += 1;
    }
    for (var day in dailyInstance.time) {
      _dailyWeather = {
        day: [
          dailyInstance.weathercode[dayIndex],
          dailyInstance.temperature2MMax[dayIndex],
          dailyInstance.temperature2MMin[dayIndex],
          dailyInstance.windspeed10MMax[dayIndex],
        ]
      };
      if (day.day == nowTime.day) {
        _todayWeather = _dailyWeather[day] as List;
      }
      dayIndex += 1;
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

    _lat = position.latitude;
    _long = position.longitude;
  }

  void findCoundtry(String name) {
    _searchedListCountries = countriesConstants.where((element) {
      final countryName = element.name.toLowerCase();
      final searchInput = name.toLowerCase();
      return countryName.contains(searchInput);
    }).toList();

    notifyListeners();
  }

  WeatherCodeModel? getWeatherStack(double code) {
    for (var item in weatherCodeConstant) {
      if (item.weatherCode == code) {
        return item;
      }
    }
    return null;
    // weatherCodeConstant.firstWhere((element) {
    //   if (element.weatherCode == code) {
    //     print(element);
    //     weatherCodeModel = element;
    //   }
    //   return false;
    // });
  }
}
