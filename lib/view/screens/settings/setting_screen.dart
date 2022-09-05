import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rainery/view-model/theme_provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, actions: [
        Consumer<ThemeProvider>(
          builder: (context, themeNotifier, child) => IconButton(
            icon: themeNotifier.isDark
                ? const Icon(CupertinoIcons.sun_min_fill)
                : const Icon(CupertinoIcons.moon_stars_fill),
            onPressed: () => themeNotifier.switchTheme(),
          ),
        ),
      ]),
    );
    // return Center(
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Consumer<ThemeProvider>(
    //         builder: (context, themeNotifier, child) => Switch(
    //           value: themeNotifier.isDark,
    //           onChanged: (value) => themeNotifier.switchTheme(),
    //         ),
    //       ),
    //       ElevatedButton(
    //           onPressed: () async {
    //             await Geolocator.checkPermission();
    //             await Geolocator.getCurrentPosition(
    //                 desiredAccuracy: LocationAccuracy.low);
    //           },
    //           child: const Text("data")),
    //     ],
    //   ),
    // );
  }
}
