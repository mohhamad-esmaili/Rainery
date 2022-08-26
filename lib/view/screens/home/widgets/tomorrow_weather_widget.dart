import 'package:flutter/material.dart';
import 'package:rainery/config/themes.dart';
import 'package:rainery/utils/align_constants.dart';

class TomarrowWeatherRowWidget extends StatelessWidget {
  const TomarrowWeatherRowWidget(
      {Key? key,
      required this.title,
      required this.icon,
      required this.maxTemp,
      required this.minTemp})
      : super(key: key);
  final String title;
  final IconData icon;
  final String maxTemp;
  final String minTemp;
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
            title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Icon(icon),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                maxTemp,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(width: 10),
              Text(
                minTemp,
                style: AppTheme.infoTextstyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
