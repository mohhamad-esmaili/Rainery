import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rainery/models/weather_model.dart';
import 'package:rainery/utils/align_constants.dart';
import 'package:rainery/view-model/weather_provider.dart';

import 'package:rainery/view/screens/home/widgets/widget_exporter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, weatherNotifier, child) {
        List todayWeather = weatherNotifier.todayWeather;
        WeatherModel current = weatherNotifier.getWeather;

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
                          "${current.latitude.toStringAsFixed(0)}-${current.longitude.toStringAsFixed(0)}"),
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
            const SizedBox(height: 20),
            const TomarrowWeatherRowWidget(
              title: "Tuesday",
              icon: CupertinoIcons.cloud_rain_fill,
              maxTemp: "19",
              minTemp: "12",
            ),
            const TomarrowWeatherRowWidget(
              title: "Tuesday",
              icon: Icons.cloud,
              maxTemp: "19",
              minTemp: "12",
            ),
            const TomarrowWeatherRowWidget(
              title: "Tuesday",
              icon: Icons.cloud,
              maxTemp: "19",
              minTemp: "12",
            ),
          ],
        );
      },
    );
  }
}
