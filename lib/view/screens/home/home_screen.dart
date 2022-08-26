import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rainery/utils/align_constants.dart';
import 'package:rainery/view-model/weather_provider.dart';

import 'package:rainery/view/screens/home/widgets/widget_exporter.dart';
import 'package:rainery/view/widget/status_widget.dart';
import 'package:rainery/view/widget/weather_status_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, value, child) {
        log(value.todayWeatherGetter.toString());
        List todayWeather = value.todayWeatherGetter;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: elementAlignment,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "San Fransisco",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Text(
                        "${todayWeather[1].toString()}°",
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const WeatherStatusWidget(title: "Cloudy"),
                    ],
                  ),
                ),
                const Spacer(),
                const StatusStackWidget(),
              ],
            ),
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
                      icon: CupertinoIcons.drop, title: "data"),
                  MoreInfoSectionWidget(
                      icon: CupertinoIcons.wind,
                      title: todayWeather[3].toString()),
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
            Expanded(
              child: ListView.builder(
                itemCount: 7,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.only(
                      left: elementAlignment.left,
                      right: 10,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "10 AM",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const WeatherStatusStackWidget(),
                        // const Icon(
                        //   Icons.cloud,
                        // ),
                        Text(
                          "18°",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const TomarrowWeatherRowWidget(
              title: "Tuesday",
              icon: CupertinoIcons.cloud_rain_fill,
              maxTemp: "19°",
              minTemp: "12°",
            ),
            const TomarrowWeatherRowWidget(
              title: "Tuesday",
              icon: Icons.cloud,
              maxTemp: "19°",
              minTemp: "12°",
            ),
            const TomarrowWeatherRowWidget(
              title: "Tuesday",
              icon: Icons.cloud,
              maxTemp: "19°",
              minTemp: "12°",
            ),
          ],
        );
      },
    );
  }
}
