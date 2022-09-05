import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rainery/config/themes.dart';
import 'package:rainery/utils/align_constants.dart';
import 'package:rainery/view/screens/widget/weather_status.dart';

class TomarrowWeatherRowWidget extends StatelessWidget {
  const TomarrowWeatherRowWidget(
      {Key? key,
      required this.title,
      required this.icon,
      required this.maxTemp,
      required this.minTemp})
      : super(key: key);
  final DateTime title;
  final IconData icon;
  final double maxTemp;
  final double minTemp;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: elementAlignment.left, right: 25, bottom: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            DateFormat('EEEE').format(title),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WeatherStatusIconWidget(
                iconData: icon,
                iconSize: 30,
                paddingLeft: 0,
              ),
              const SizedBox(width: 50),
              Text(
                "$maxTemp°",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(width: 10),
              Text(
                "$minTemp°",
                style: AppTheme.infoTextstyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
