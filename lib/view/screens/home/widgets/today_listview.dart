import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rainery/models/weathercode_model.dart';
import 'package:rainery/utils/align_constants.dart';
import 'package:rainery/view-model/weather_provider.dart';
import 'package:rainery/view/screens/widget/weather_status.dart';

class TodayListviewBuilderWidget extends StatelessWidget {
  const TodayListviewBuilderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherProvider weatherProvider = Provider.of<WeatherProvider>(context);
    List hourlyWeather = weatherProvider.hourlyWeather;
    return Expanded(
      child: ListView.builder(
        itemCount: hourlyWeather.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          String time = DateFormat.jm().format(hourlyWeather[index][0]);
          double temp = hourlyWeather[index][1];
          WeatherCodeModel? weatherCodeModel =
              weatherProvider.getWeatherCode(hourlyWeather[index][2]);
          return Container(
            padding: EdgeInsets.only(
              left: elementAlignment.left,
              right: 10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  time.toString(),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                WeatherStatusIconWidget(
                  iconData: weatherCodeModel.iconData,
                  iconSize: 30,
                  paddingLeft: 0,
                ),
                Text(
                  "$temp°",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
