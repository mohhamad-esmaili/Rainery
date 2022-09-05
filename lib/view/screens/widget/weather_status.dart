import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rainery/view-model/theme_provider.dart';

class WeatherStatusIconWidget extends StatelessWidget {
  const WeatherStatusIconWidget(
      {Key? key,
      required this.iconData,
      required this.iconSize,
      required this.paddingLeft,
      this.sizedBoxWidth,
      this.shadowOn = false})
      : super(key: key);
  final IconData iconData;
  final double iconSize;
  final double? sizedBoxWidth;
  final bool shadowOn;
  final double paddingLeft;
  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<ThemeProvider>(context, listen: true).isDark;
    return SizedBox(
      width: sizedBoxWidth,
      child: Stack(
        children: [
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: isDark
                  ? <Color>[
                      const Color(0xffD75EF9),
                      const Color(0xff2AAFFF),
                    ]
                  : <Color>[
                      const Color(0xffFF5CA3),
                      const Color(0xffFFB67F),
                    ],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ).createShader(bounds),
            child: Padding(
              padding: EdgeInsets.only(left: paddingLeft),
              child: Icon(
                iconData,
                size: iconSize,
                color: Colors.white,
                shadows: shadowOn
                    ? [
                        const Shadow(
                          color: Color(0xffFFB67F),
                          blurRadius: 10,
                          offset: Offset(-2, 0),
                        ),
                      ]
                    : [],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
