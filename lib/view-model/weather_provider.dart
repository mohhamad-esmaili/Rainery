import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rainery/config/router/router_constants.dart';
import 'package:rainery/models/country_model.dart';
import 'package:rainery/models/weather_model.dart';
import 'package:rainery/models/weathercode_model.dart';
import 'package:rainery/service/weather_service.dart';
import 'package:rainery/utils/country_constants.dart';
import 'package:rainery/utils/weathercode_constants.dart';
import 'package:rainery/view/screens/widget/snackbar.dart';

class WeatherProvider extends ChangeNotifier {
  bool _isLoading = true;
  var _todayWeather = [];
  double _currentLat = 36;
  double _currentLong = 51;
  WeatherModel? _weatherFromApi;
  final List _hourlyWeather = [];
  final DateTime nowTime = DateTime.now();
  final Map<DateTime, List> _dailyWeather = {};
  final List _threeDaysWeather = [];
  List<CountryModel> _searchedListCountries = countriesConstants;

  WeatherProvider() {
    getLocationFromGPS();
    setWeather();
  }

  /// show splash when is loading and its getter
  get getLoading => _isLoading;

  get futureDayWeather => _threeDaysWeather;

  /// all data getter
  get hourlyWeather => _hourlyWeather;
  set setLoading(bool newValue) => _isLoading = newValue;
  get searchedListCountries => _searchedListCountries;

  /// this getter will return today weather data
  /// this returns [List] of data like weatherCode
  get getLoadedWeather => _weatherFromApi;

  /// get today weather
  get todayWeather => _todayWeather;

  /// set and update weather from api and refresh
  setWeather() async {
    _weatherFromApi =
        await WeatherService.getWeather(_currentLat, _currentLong);
    fetchDayAndData(_weatherFromApi!);
    setLoading = false;

    notifyListeners();
  }

  /// this function combine several list into Map
  /// `key: DateTime` and value is `List[weatherCode,temperature2MMax,...]`
  /// this function set todayWeather value too
  void fetchDayAndData(WeatherModel loadedWeather) {
    int dayIndex = 0;
    int hourIndex = 0;

    Daily dailyInstance = loadedWeather.daily;
    Hourly hourlyInstance = loadedWeather.hourly;

    _dailyWeather.clear();
    _hourlyWeather.clear();
    _threeDaysWeather.clear();

    /// loop for get hourly weather
    for (var hour in hourlyInstance.time) {
      DateTime parsedHour = DateTime.parse(hour);
      if (parsedHour.day == nowTime.day) {
        _hourlyWeather.add([
          parsedHour,
          hourlyInstance.temperature2M[hourIndex],
          hourlyInstance.weathercode[hourIndex]
        ]);
      }
      hourIndex += 1;
    }

    for (var day in dailyInstance.time) {
      _dailyWeather[day] = [
        dailyInstance.weathercode[dayIndex],
        dailyInstance.temperature2MMax[dayIndex],
        dailyInstance.temperature2MMin[dayIndex],
        dailyInstance.windspeed10MMax[dayIndex],
      ];
      if (day.isAfter(nowTime)) {
        _threeDaysWeather.add([
          day,
          dailyInstance.weathercode[dayIndex],
          dailyInstance.temperature2MMax[dayIndex],
          dailyInstance.temperature2MMin[dayIndex],
          dailyInstance.windspeed10MMax[dayIndex],
        ]);
      }
      if (day.day == nowTime.day) {
        _todayWeather = _dailyWeather[day] as List;
      }

      dayIndex += 1;
    }
  }

  /// this function will change latlong with gps
  getLocationFromGPS() async {
    LocationPermission permission;
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
    _currentLat = position.latitude;
    _currentLong = position.longitude;
  }

  /// this function is for [SearchScreen] and find entered country by name
  void searchCountry(String name) {
    _searchedListCountries = countriesConstants.where((element) {
      final countryName = element.name.toLowerCase();
      final searchInput = name.toLowerCase();
      return countryName.contains(searchInput);
    }).toList();

    notifyListeners();
  }

  /// this function return weather code from weatherCodeConstant
  /// and return the weather
  WeatherCodeModel getWeatherCode(double code) {
    for (var item in weatherCodeConstant) {
      if (item.weatherCode == code) {
        return item;
      }
    }
    return weatherCodeConstant[0];
  }

  /// change country and load data from api
  void changeCurrentCountry(BuildContext context, double lat, double long,
      String locationName) async {
    _currentLat = lat;
    _currentLong = long;
    setLoading = true;

    ScaffoldMessenger.of(context)
        .showSnackBar(snackBarWidget(context, locationName));
    Navigator.of(context).pushReplacementNamed(splashRoute);
    await setWeather();
  }

  /// this function check currentLatlong and the selected one from searchscreen
  bool checkLatLong(double lat, double long) {
    if (doubleParse(lat) == doubleParse(_currentLat) &&
        doubleParse(long) == doubleParse(_currentLong)) {
      return true;
    }
    return false;
  }

  /// cut lat longs digit to let easier check
  double doubleParse(double doubleToParse) =>
      double.parse(doubleToParse.toStringAsFixed(0));
}
