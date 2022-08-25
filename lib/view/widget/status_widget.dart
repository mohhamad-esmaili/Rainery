import 'package:flutter/material.dart';
import 'package:rainery/config/colors.dart';

class WeatherStatusWidget extends StatelessWidget {
  const WeatherStatusWidget({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: mainColors.lightContainerBG,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
