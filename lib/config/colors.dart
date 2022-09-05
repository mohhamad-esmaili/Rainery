import 'package:flutter/cupertino.dart';

final MainColors mainColors = MainColors();
final TextColors textColors = TextColors();
final UtilsColors utilsColors = UtilsColors();

class MainColors {
  final Color lightScaffoldBG = const Color(0xffF9F9F3);
  final Color darkScaffoldBG = const Color(0xff081B24);

  final Color lightContainerBG = const Color(0xffF2EFEC);
  final Color darkContainerBG = const Color(0xff423654);

  final Color lightBackgroundColor = const Color.fromARGB(255, 236, 236, 236);
  final Color darkBackgroundColor = const Color(0xff152C39);
}

class TextColors {
  final Color darkTextcolor = const Color(0xff2E3151);
  final Color lightTextcolor = const Color(0xffffffff);

  final Color lightSectionTitleTextcolor = const Color(0xff7A7799);
  final Color darkSectionTitleTextcolor = const Color(0xff576776);
}

class UtilsColors {
  final Color lightSelectedIconColor = const Color(0xff2E3151);
  final Color darkSelectedIconColor = const Color(0xffE48D9F);

  final Color darkUnSelectedIconColor = const Color(0xffDDC4AC);

  final Color subColor = const Color(0xff6B7B88);
}
