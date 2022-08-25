import 'package:flutter/cupertino.dart';

final MainColors mainColors = MainColors();
final TextColors textColors = TextColors();
final UtilsColors utilsColors = UtilsColors();

class MainColors {
  final Color lightScaffoldBG = const Color(0xffFDFCF3);
  final Color darkScaffoldBG = const Color(0xff030708);

  final Color lightContainerBG = const Color(0xffF2EFEC);
  final Color darkContainerBG = const Color(0xff423654);
}

class TextColors {
  final Color darkTextcolor = const Color(0xff2E3151);
  final Color lightTextcolor = const Color(0xffECCDDA);

  final Color lightSectionTitleTextcolor = const Color(0xff7A7799);
  final Color darkSectionTitleTextcolor = const Color(0xff576776);
}

class UtilsColors {
  final Color lightSelectedIconColor = const Color(0xff2E3151);
  final Color darkSelectedIconColor = const Color(0xffE48D9F);

  final Color darkUnSelectedIconColor = const Color(0xffDDC4AC);

  final Color subColor = const Color(0xff6B7B88);
}
