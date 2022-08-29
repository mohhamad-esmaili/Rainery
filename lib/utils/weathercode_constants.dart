import 'package:flutter/cupertino.dart';
import 'package:rainery/models/weathercode_model.dart';
import 'package:flutter/material.dart';

List<WeatherCodeModel> weatherCodeConstant = [
  WeatherCodeModel(
    weatherCode: 0.0,
    name: "Clear",
    iconData: CupertinoIcons.circle_fill,
  ),
  WeatherCodeModel(
    weatherCode: 1.0,
    name: "Cloudy",
    iconData: CupertinoIcons.cloud_sun_fill,
  ),
  WeatherCodeModel(
    weatherCode: 2.0,
    name: "Snow Blow",
    iconData: CupertinoIcons.wind_snow,
  ),
  WeatherCodeModel(
    weatherCode: 3.0,
    name: "Sandstorm",
    iconData: Icons.storm_rounded,
  ),
  WeatherCodeModel(
    weatherCode: 4.0,
    name: "Foggy",
    iconData: Icons.foggy,
  ),
  WeatherCodeModel(
    weatherCode: 5.0,
    name: "Drizzle",
    iconData: CupertinoIcons.cloud_drizzle_fill,
  ),
  WeatherCodeModel(
    weatherCode: 6.0,
    name: "Rain",
    iconData: CupertinoIcons.cloud_rain_fill,
  ),
  WeatherCodeModel(
    weatherCode: 7.0,
    name: "Snow or Rain",
    iconData: CupertinoIcons.cloud_bolt_rain_fill,
  ),
  WeatherCodeModel(
    weatherCode: 8.0,
    name: "Shower",
    iconData: CupertinoIcons.cloud_rain_fill,
  ),
  WeatherCodeModel(
    weatherCode: 9.0,
    name: "Thunderstorm",
    iconData: Icons.thunderstorm_rounded,
  ),
];
