import 'package:flutter/material.dart';
import 'package:rainery/config/router/router.dart';
import 'package:rainery/config/router/router_constants.dart';
import 'package:rainery/config/themes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rainery',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: splashRoute,
    );
  }
}
