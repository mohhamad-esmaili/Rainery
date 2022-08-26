import 'package:flutter/cupertino.dart';
import 'package:rainery/models/weather_model.dart';
import 'package:rainery/service/weather_service.dart';

class WeatherProvider extends ChangeNotifier {
  bool _isLoading = true;
  WeatherModel? _loadedWeather;
  final DateTime _nowTime = DateTime.now();
  Map<DateTime, List> _dailyWeather = {};
  var _todayWeather = [];

  set setLoading(bool newValue) => _isLoading = newValue;
  get getLoading => _isLoading;

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

  /// this getter will return today weather data
  /// this returns [List] of data like weatherCode
  get getWeather => _loadedWeather;
  get todayWeatherGetter {
    return _todayWeather;
  }

  setWeather() async {
    _loadedWeather = await WeatherService.getWeather();
    fetchDayAndData();
    setLoading = false;

    notifyListeners();
  }
}
