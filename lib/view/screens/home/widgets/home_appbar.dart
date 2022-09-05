import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rainery/models/weather_model.dart';
import 'package:rainery/models/weathercode_model.dart';
import 'package:rainery/utils/align_constants.dart';
import 'package:rainery/view-model/weather_provider.dart';
import 'package:rainery/view/screens/widget/weather_status.dart';
import 'package:rainery/view/screens/widget/status_widget.dart';

class HomeAppbarRowWidget extends StatelessWidget {
  const HomeAppbarRowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherProvider weatherProvider = Provider.of<WeatherProvider>(context);
    WeatherModel weatherModel = weatherProvider.getLoadedWeather;
    List todayWeather = weatherProvider.todayWeather;

    WeatherCodeModel? weatherCodeModel =
        weatherProvider.getWeatherCode(todayWeather[0]);

    return Row(
      children: [
        Padding(
          padding: elementAlignment,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                weatherModel.timezone,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                "${todayWeather[1].toString()}°",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              WeatherStatusWidget(title: weatherCodeModel.name),
            ],
          ),
        ),
        const Spacer(),
        WeatherStatusIconWidget(
          iconData: weatherCodeModel.iconData,
          iconSize: 250,
          sizedBoxWidth: 170,
          shadowOn: true,
          paddingLeft: 20,
        )
      ],
    );
  }
}
