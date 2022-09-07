import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rainery/models/weather_model.dart';
import 'package:rainery/models/weathercode_model.dart';
import 'package:rainery/view-model/weather_provider.dart';

import 'package:rainery/utils/align_constants.dart';

import 'package:rainery/view/screens/home/widgets/widget_exporter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, weatherNotifier, child) {
        List todayWeather = weatherNotifier.todayWeather;
        WeatherModel current = weatherNotifier.getLoadedWeather;
        List futureWeather = weatherNotifier.futureDayWeather;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeAppbarRowWidget(),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(
                left: elementAlignment.left,
                right: elementAlignment.left,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MoreInfoSectionWidget(
                      icon: CupertinoIcons.globe,
                      title:
                          "${current.latitude.toStringAsFixed(0)}/${current.longitude.toStringAsFixed(0)}"),
                  MoreInfoSectionWidget(
                      icon: CupertinoIcons.wind,
                      title: "${todayWeather[3].toString()} km/h"),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: elementAlignment,
              child: Text(
                "Today",
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            const SizedBox(height: 20),
            const TodayListviewBuilderWidget(),
            Padding(
              padding: elementAlignment,
              child: Text(
                "Future weather",
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: futureWeather.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  WeatherCodeModel? weatherCodeModel =
                      weatherNotifier.getWeatherCode(futureWeather[index][1]);
                  return TomarrowWeatherRowWidget(
                    title: futureWeather[index][0],
                    icon: weatherCodeModel.iconData,
                    maxTemp: futureWeather[index][2],
                    minTemp: futureWeather[index][3],
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
