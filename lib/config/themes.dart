import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rainery/config/colors.dart';

class AppTheme {
  static final infoTextstyle = TextStyle(
    color: utilsColors.subColor,
    fontSize: 18,
  );
  static final lightTheme = ThemeData(
    fontFamily: GoogleFonts.notoSans().fontFamily,
    scaffoldBackgroundColor: mainColors.lightScaffoldBG,
    backgroundColor: mainColors.lightBackgroundColor,
    // texttheme data
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        color: textColors.darkTextcolor,
        fontSize: 60,
      ),
      headlineMedium: TextStyle(
          color: textColors.darkTextcolor,
          fontSize: 19,
          overflow: TextOverflow.ellipsis),
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
      bodySmall: TextStyle(
        color: textColors.darkTextcolor,
        fontSize: 15,
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
    appBarTheme: AppBarTheme(
      backgroundColor: mainColors.lightScaffoldBG,
      elevation: 0,
      iconTheme: IconThemeData(color: textColors.darkTextcolor),
    ),
  );

  static final darkTheme = ThemeData(
    fontFamily: GoogleFonts.notoSans().fontFamily,
    scaffoldBackgroundColor: mainColors.darkScaffoldBG,
    backgroundColor: mainColors.darkBackgroundColor,
    // texttheme data
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        color: textColors.lightTextcolor,
        fontSize: 60,
      ),
      headlineMedium: TextStyle(
        color: textColors.lightTextcolor,
        fontSize: 20,
        overflow: TextOverflow.ellipsis,
      ),
      headlineSmall: TextStyle(
        color: textColors.lightTextcolor,
        fontSize: 15,
      ),
      bodySmall: TextStyle(
        color: textColors.darkTextcolor,
        fontSize: 15,
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
    appBarTheme: AppBarTheme(
      backgroundColor: mainColors.darkScaffoldBG,
      elevation: 0,
      iconTheme: IconThemeData(color: textColors.lightTextcolor),
    ),
  );
}
