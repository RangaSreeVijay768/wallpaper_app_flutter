import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class AppColors {
  static const Color primary = Color.fromRGBO(41, 66, 136, 1);
  static const Color bgPrimary = Color.fromRGBO(13, 139, 255, 1);
  static const Color bgPrimary01 = Color.fromRGBO(13, 139, 255, 0.2);
  static const Color bgPrimary2 = Color.fromRGBO(13, 110, 255, 1);
  static const Color waterPrimary = Color.fromRGBO(0, 147, 183, 1);
  static const Color skyBlue = Color.fromRGBO(64, 165, 243, 1);

  static const Color textHeading = Color.fromRGBO(46, 46, 46, 1);
  static const Color textNormal = Color.fromRGBO(46, 46, 46, 1);
  static const Color transparent = Color.fromRGBO(0, 0, 0, 0);
  static const Color transparent05 = Color.fromRGBO(0, 0, 0, 0.2);
  static const Color dark = Color.fromRGBO(18, 32, 60, 1);
  static const Color dark2 = Color.fromRGBO(18, 13, 40, 1);
  static const Color grey5 = Color.fromRGBO(80, 80, 80, 1);
  static const Color grey1 = Color.fromRGBO(120, 120, 120, 1);
  static const Color grey2 = Color.fromRGBO(234, 234, 234, 1);
  static const Color grey3 = Color.fromRGBO(247, 247, 247, 1);
  static const Color grey4 = Color.fromRGBO(177, 177, 177, 1);
  static const Color white = Color.fromRGBO(255, 255, 255, 1);
  static const Color white03 = Color.fromRGBO(255, 255, 255, 0.3);
  static const Color white04 = Color.fromRGBO(255, 255, 255, 0.4);
  static const Color white06 = Color.fromRGBO(255, 255, 255, 0.8);
  static const Color white09 = Color.fromRGBO(255, 255, 255, 0.9);
  static const Color white012 = Color.fromRGBO(255, 255, 255, 0.12);
  static const Color white018 = Color.fromRGBO(255, 255, 255, 0.18);
  static const Color greyWhite = Color.fromRGBO(244, 229, 190, 1);
  static const Color bgLightGrey = Color.fromRGBO(234, 236, 243, 1);
  static const Color bgLightBlue = Color.fromRGBO(130, 207, 243, 1.0);
  static const Color bgError = Color.fromRGBO(224, 36, 36, 0.6);
  static const Color bgRed = Color.fromRGBO(224, 36, 36, 1);
  static const Color green = Color.fromRGBO(15, 184, 0, 1);
  static const Color green05 = Color.fromRGBO(100, 180, 100, 0.6);
  static const Color coinProgress = Color.fromRGBO(255, 204, 102, 1);
  static const Color bmiTracker = Color.fromRGBO(115, 41, 209, 1);
  static const Color brown = Color.fromRGBO(197, 142, 76, 1);

  static const Color rainbow1 = Color.fromRGBO(148, 0, 211, 1);
  static const Color rainbow2 = Color.fromRGBO(75, 0, 130, 1);
  static const Color rainbow3 = Color.fromRGBO(0, 0, 255, 1);
  static const Color rainbow4 = Color.fromRGBO(0, 255, 0, 1);
  static const Color rainbow5 = Color.fromRGBO(255, 255, 0, 1);
  static const Color rainbow6 = Color.fromRGBO(255, 127, 0, 1);
  static const Color rainbow7 = Color.fromRGBO(255, 0, 255, 1);

  static const Color bar1 = Color.fromRGBO(222, 111, 161, 0.5);
  static const Color bar2 = Color.fromRGBO(253, 146, 87, 0.5);
  static const Color bar3 = Color.fromRGBO(76, 223, 68, 0.5);
  static const Color bar4 = Color.fromRGBO(154, 205, 50, 0.5);

  static const Color truck1 = Color.fromRGBO(152, 251, 152, 0.5);
  static const Color truck2 = Color.fromRGBO(255, 160, 122, 0.5);
  static const Color truck3 = Color.fromRGBO(221, 160, 221, 0.5);

  static const List<Color> formTemplateColors = [
    Color.fromRGBO(221, 160, 221, 1),
    Color.fromRGBO(177, 238, 171, 1),
    Color.fromRGBO(217, 141, 177, 1),
    Color.fromRGBO(255, 160, 122, 1),
    Color.fromRGBO(237, 145, 33, 1),
  ];

  static ColorFilter bgFilter =
      ColorFilter.mode(Colors.white.withOpacity(0.4), BlendMode.dstATop);
}

const primary = Color(0xff4f359b);
const white = Color(0xffffffff);
