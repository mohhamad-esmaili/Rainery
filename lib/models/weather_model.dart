// To parse this JSON data, do
//
//     final weatherModel = weatherModelFromJson(jsonString);

import 'dart:convert';

WeatherModel weatherModelFromJson(String str) =>
    WeatherModel.fromJson(json.decode(str));

String weatherModelToJson(WeatherModel data) => json.encode(data.toJson());

class WeatherModel {
  WeatherModel({
    required this.latitude,
    required this.longitude,
    required this.generationtimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.hourlyUnits,
    required this.hourly,
    required this.dailyUnits,
    required this.daily,
  });

  num latitude;
  num longitude;
  num generationtimeMs;
  num utcOffsetSeconds;
  String timezone;
  String timezoneAbbreviation;
  num elevation;
  HourlyUnits hourlyUnits;
  Hourly hourly;
  DailyUnits dailyUnits;
  Daily daily;

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        generationtimeMs: json["generationtime_ms"].toDouble(),
        utcOffsetSeconds: json["utc_offset_seconds"].toDouble(),
        timezone: json["timezone"],
        timezoneAbbreviation: json["timezone_abbreviation"],
        elevation: json["elevation"].toDouble(),
        hourlyUnits: HourlyUnits.fromJson(json["hourly_units"]),
        hourly: Hourly.fromJson(json["hourly"]),
        dailyUnits: DailyUnits.fromJson(json["daily_units"]),
        daily: Daily.fromJson(json["daily"]),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "generationtime_ms": generationtimeMs,
        "utc_offset_seconds": utcOffsetSeconds,
        "timezone": timezone,
        "timezone_abbreviation": timezoneAbbreviation,
        "elevation": elevation,
        "hourly_units": hourlyUnits.toJson(),
        "hourly": hourly.toJson(),
        "daily_units": dailyUnits.toJson(),
        "daily": daily.toJson(),
      };
}

class Daily {
  Daily({
    required this.time,
    required this.weathercode,
    required this.temperature2MMax,
    required this.temperature2MMin,
    required this.apparentTemperatureMax,
    required this.apparentTemperatureMin,
    required this.sunrise,
    required this.sunset,
    required this.rainSum,
    required this.windspeed10MMax,
  });

  List<DateTime> time;
  List<num> weathercode;
  List<num> temperature2MMax;
  List<num> temperature2MMin;
  List<num> apparentTemperatureMax;
  List<num> apparentTemperatureMin;
  List<String> sunrise;
  List<String> sunset;
  List<num> rainSum;
  List<num> windspeed10MMax;

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        time: List<DateTime>.from(json["time"].map((x) => DateTime.parse(x))),
        weathercode: List<num>.from(json["weathercode"].map((x) => x)),
        temperature2MMax:
            List<num>.from(json["temperature_2m_max"].map((x) => x.toDouble())),
        temperature2MMin:
            List<num>.from(json["temperature_2m_min"].map((x) => x.toDouble())),
        apparentTemperatureMax: List<num>.from(
            json["apparent_temperature_max"].map((x) => x.toDouble())),
        apparentTemperatureMin: List<num>.from(
            json["apparent_temperature_min"].map((x) => x.toDouble())),
        sunrise: List<String>.from(json["sunrise"].map((x) => x)),
        sunset: List<String>.from(json["sunset"].map((x) => x)),
        rainSum: List<num>.from(json["rain_sum"].map((x) => x)),
        windspeed10MMax:
            List<num>.from(json["windspeed_10m_max"].map((x) => x.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "time": List<dynamic>.from(time.map((x) =>
            "${x.year.toString().padLeft(4, '0')}-${x.month.toString().padLeft(2, '0')}-${x.day.toString().padLeft(2, '0')}")),
        "weathercode": List<dynamic>.from(weathercode.map((x) => x)),
        "temperature_2m_max":
            List<dynamic>.from(temperature2MMax.map((x) => x)),
        "temperature_2m_min":
            List<dynamic>.from(temperature2MMin.map((x) => x)),
        "apparent_temperature_max":
            List<dynamic>.from(apparentTemperatureMax.map((x) => x)),
        "apparent_temperature_min":
            List<dynamic>.from(apparentTemperatureMin.map((x) => x)),
        "sunrise": List<dynamic>.from(sunrise.map((x) => x)),
        "sunset": List<dynamic>.from(sunset.map((x) => x)),
        "rain_sum": List<dynamic>.from(rainSum.map((x) => x)),
        "windspeed_10m_max": List<dynamic>.from(windspeed10MMax.map((x) => x)),
      };
}

class DailyUnits {
  DailyUnits({
    required this.time,
    required this.weathercode,
    required this.temperature2MMax,
    required this.temperature2MMin,
    required this.apparentTemperatureMax,
    required this.apparentTemperatureMin,
    required this.sunrise,
    required this.sunset,
    required this.rainSum,
    required this.windspeed10MMax,
  });

  String time;
  String weathercode;
  String temperature2MMax;
  String temperature2MMin;
  String apparentTemperatureMax;
  String apparentTemperatureMin;
  String sunrise;
  String sunset;
  String rainSum;
  String windspeed10MMax;

  factory DailyUnits.fromJson(Map<String, dynamic> json) => DailyUnits(
        time: json["time"],
        weathercode: json["weathercode"],
        temperature2MMax: json["temperature_2m_max"],
        temperature2MMin: json["temperature_2m_min"],
        apparentTemperatureMax: json["apparent_temperature_max"],
        apparentTemperatureMin: json["apparent_temperature_min"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        rainSum: json["rain_sum"],
        windspeed10MMax: json["windspeed_10m_max"],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "weathercode": weathercode,
        "temperature_2m_max": temperature2MMax,
        "temperature_2m_min": temperature2MMin,
        "apparent_temperature_max": apparentTemperatureMax,
        "apparent_temperature_min": apparentTemperatureMin,
        "sunrise": sunrise,
        "sunset": sunset,
        "rain_sum": rainSum,
        "windspeed_10m_max": windspeed10MMax,
      };
}

class Hourly {
  Hourly({
    required this.time,
    required this.temperature2M,
    required this.weathercode,
  });

  List<String> time;
  List<num> temperature2M;
  List<num> weathercode;

  factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
        time: List<String>.from(json["time"].map((x) => x)),
        temperature2M:
            List<num>.from(json["temperature_2m"].map((x) => x.toDouble())),
        weathercode: List<num>.from(json["weathercode"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "time": List<dynamic>.from(time.map((x) => x)),
        "temperature_2m": List<dynamic>.from(temperature2M.map((x) => x)),
        "weathercode": List<dynamic>.from(weathercode.map((x) => x)),
      };
}

class HourlyUnits {
  HourlyUnits({
    required this.time,
    required this.temperature2M,
    required this.weathercode,
  });

  String time;
  String temperature2M;
  String weathercode;

  factory HourlyUnits.fromJson(Map<String, dynamic> json) => HourlyUnits(
        time: json["time"],
        temperature2M: json["temperature_2m"],
        weathercode: json["weathercode"],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "temperature_2m": temperature2M,
        "weathercode": weathercode,
      };
}
