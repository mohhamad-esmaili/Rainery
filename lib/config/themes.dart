import 'package:flutter/material.dart';
import 'package:rainery/config/colors.dart';

class AppTheme {
  static final infoTextstyle = TextStyle(
    color: utilsColors.subColor,
    fontSize: 18,
  );
  static final lightTheme = ThemeData(
    fontFamily: 'NotoSans',
    scaffoldBackgroundColor: mainColors.lightScaffoldBG,

    // texttheme data
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        color: textColors.darkTextcolor,
        fontSize: 60,
      ),
      headlineMedium: TextStyle(
        color: textColors.darkTextcolor,
        fontSize: 20,
      ),
      headlineSmall: TextStyle(
        color: textColors.darkTextcolor,
        fontSize: 15,
      ),
      labelMedium: TextStyle(
        color: textColors.lightSectionTitleTextcolor,
        fontSize: 15,
      ),
      titleSmall: TextStyle(
        color: textColors.darkTextcolor,
        fontSize: 13,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle(
        color: textColors.darkTextcolor,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    ),
    iconTheme: IconThemeData(color: textColors.darkTextcolor),
    // botttom navigation theme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 0.0,
      backgroundColor: mainColors.lightScaffoldBG,
      selectedItemColor: utilsColors.lightSelectedIconColor,
      unselectedItemColor: utilsColors.darkUnSelectedIconColor,
    ),
  );

  static final darkTheme = ThemeData(
    fontFamily: 'NotoSans',
    scaffoldBackgroundColor: mainColors.darkScaffoldBG,

    // texttheme data
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        color: textColors.lightTextcolor,
        fontSize: 60,
      ),
      headlineMedium: TextStyle(
        color: textColors.lightTextcolor,
        fontSize: 20,
      ),
      headlineSmall: TextStyle(
        color: textColors.lightTextcolor,
        fontSize: 18,
      ),
      labelMedium: TextStyle(
        color: textColors.darkSectionTitleTextcolor,
        fontSize: 15,
      ),
      titleSmall: TextStyle(
        color: textColors.lightTextcolor,
        fontSize: 13,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle(
        color: textColors.lightTextcolor,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    ),
    iconTheme: IconThemeData(color: textColors.lightTextcolor),
    // botttom navigation theme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 0.0,
      backgroundColor: mainColors.darkScaffoldBG,
      selectedItemColor: utilsColors.darkSelectedIconColor,
      unselectedItemColor: utilsColors.darkUnSelectedIconColor,
    ),
  );
}
