import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rainery/models/weather_model.dart';
import 'package:rainery/models/weathercode_model.dart';
import 'package:rainery/utils/align_constants.dart';
import 'package:rainery/view-model/weather_provider.dart';
import 'package:rainery/view/screens/home/widgets/appbar_weather.dart';
import 'package:rainery/view/widget/status_widget.dart';

class HomeAppbarRowWidget extends StatelessWidget {
  const HomeAppbarRowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherProvider weatherProvider = Provider.of<WeatherProvider>(context);
    WeatherModel weatherModel = weatherProvider.getWeather;
    List todayWeather = weatherProvider.todayWeather;
    WeatherCodeModel? weatherCodeModel =
        weatherProvider.getWeatherStack(todayWeather[0]);
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
              WeatherStatusWidget(title: weatherCodeModel!.name),
            ],
          ),
        ),
        const Spacer(),
        AppbarWeatherStatusWidget(
          iconData: weatherCodeModel.iconData,
        )
      ],
    );
  }
}
