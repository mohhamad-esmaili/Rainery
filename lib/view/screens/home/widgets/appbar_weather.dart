import 'package:flutter/material.dart';
import 'package:rainery/view/widget/icon_shadermask.dart';

class AppbarWeatherStatusWidget extends StatelessWidget {
  const AppbarWeatherStatusWidget({Key? key, required this.iconData})
      : super(key: key);
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      child: Stack(
        children: [
          IconShaderMaskWidget(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Icon(
                iconData,
                size: 250,
                color: Colors.white,
                shadows: const [
                  Shadow(
                    color: Color(0xffFFB67F),
                    blurRadius: 10,
                    offset: Offset(-2, 0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
