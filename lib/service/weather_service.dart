// https://api.open-meteo.com/v1/forecast?latitude=35.7061&longitude=51.4358&hourly=weathercode&daily=weathercode,temperature_2m_max,temperature_2m_min,apparent_temperature_max,apparent_temperature_min,sunrise,sunset,windspeed_10m_max&timezone=auto&past_days=7
import 'dart:convert';
import "package:http/http.dart" as http;
import 'package:rainery/models/weather_model.dart';

class WeatherService {
  static Future getWeather(double lat, double long) async {
    try {
      var url = Uri.parse(
          "https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$long&hourly=weathercode&daily=weathercode,temperature_2m_max,temperature_2m_min,apparent_temperature_max,apparent_temperature_min,sunrise,sunset,windspeed_10m_max&timezone=auto&past_days=7");
      var response = await http.get(url);

      if (response.statusCode == 200) {
        final WeatherModel weatherModel =
            WeatherModel.fromJson(jsonDecode(response.body));

        // print(DateTime.parse(ss));

        return weatherModel;
      } else {
        Future.error("error");
      }
    } catch (e) {
      rethrow;
    }
  }
}
