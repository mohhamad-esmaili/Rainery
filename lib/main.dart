import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rainery/config/router/router.dart';
import 'package:rainery/config/router/router_constants.dart';
import 'package:rainery/config/themes.dart';
import 'package:rainery/view-model/weather_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WeatherProvider(),
      child: MaterialApp(
        title: 'Rainery',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: splashRoute,
      ),
    );
  }
}
