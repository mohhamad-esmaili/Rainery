import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:rainery/config/router/router_constants.dart';
import 'package:rainery/service/weather_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isVisible = false;

  @override
  void initState() {
    setState(() {
      isVisible = true;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: WeatherService.getWeather(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).pushReplacementNamed(homeRoute);
            });
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedOpacity(
                  opacity: isVisible ? 1.0 : 0.0,
                  duration: const Duration(seconds: 2),
                  child: Icon(
                    CupertinoIcons.cloud,
                    size: 90,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
                const SizedBox(height: 150),
                AnimatedOpacity(
                  opacity: isVisible ? 1.0 : 0.0,
                  duration: const Duration(seconds: 3),
                  child: LoadingAnimationWidget.beat(
                    color: Colors.amber,
                    size: 40,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
