import 'package:flutter/material.dart';
import 'package:rainery/config/router/router_constants.dart';

import 'package:rainery/view/screens/home/home_screen.dart';
import 'package:rainery/view/screens/main_screen.dart';
import 'package:rainery/view/screens/search/search_screen.dart';
import 'package:rainery/view/screens/settings/setting_screen.dart';
import 'package:rainery/view/screens/splash/splash_screen.dart';

class AppRouter {
  final List screens = [
    const HomeScreen(),
    const SearchScreen(),
    const SettingScreen(),
  ];

  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case homeRoute:
        return MaterialPageRoute(builder: (_) => const MainScreen());

      case searchRoute:
        return MaterialPageRoute(builder: (_) => const SearchScreen());

      case settingRoute:
        return MaterialPageRoute(builder: (_) => const SettingScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
