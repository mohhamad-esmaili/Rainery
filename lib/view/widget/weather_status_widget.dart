import 'package:flutter/material.dart';
import 'package:rainery/view/widget/icon_gradiant_widget.dart';

class WeatherStatusStackWidget extends StatelessWidget {
  const WeatherStatusStackWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        IconGradiantMask(
          child: Icon(
            Icons.circle,
            size: 30,
            color: Colors.white,
          ),
        ),
        Positioned(
          top: 1,
          right: 1,
          child: Icon(
            Icons.cloud_sharp,
            color: Color.fromARGB(221, 46, 49, 81),
            size: 15,
          ),
        ),
        Positioned(
          bottom: 0,
          child: Icon(
            Icons.cloud_sharp,
            color: Color.fromARGB(221, 46, 49, 81),
            size: 15,
          ),
        ),
      ],
    );
  }
}
