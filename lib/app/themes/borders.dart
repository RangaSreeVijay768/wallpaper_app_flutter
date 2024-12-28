
import 'dart:ui';

import 'package:flutter/cupertino.dart';

import 'app_colors.dart';

abstract class borderRadius {
  static const br_t_5 = BorderRadius.only(
      topLeft: Radius.circular(5), topRight: Radius.circular(5));
  static const br_t_20 = BorderRadius.only(
      topLeft: Radius.circular(20), topRight: Radius.circular(20));


  static BorderRadius br_0 = BorderRadius.circular(0);
  static BorderRadius br_5 = BorderRadius.circular(5);
  static BorderRadius br_10 = BorderRadius.circular(10);
  static BorderRadius br_20 = BorderRadius.circular(20);
  static BorderRadius br_25 = BorderRadius.circular(25);
  static BorderRadius br_30 = BorderRadius.circular(30);
  static BorderRadius br_100 = BorderRadius.circular(100);
}

abstract class borders {
  static Border b_1px_grey4 = Border.all(color: AppColors.grey3, width: 1);
  static Border b_1px_grey2 = Border.all(color: AppColors.grey2, width: 1);
  static Border b_1px_green = Border.all(color: AppColors.green , width: 1);
  static Border b_3px_green = Border.all(color: AppColors.green , width: 3);
  static Border b_5px_rainbow = Border.all(color: AppColors.rainbow7 , width: 2);
  static Border b_1px_bgPrimary = Border.all(color: AppColors.bgPrimary, width: 1);
  static Border b_1px_bgLightBlue = Border.all(color: AppColors.bgLightBlue, width: 1);
  static Border b_1px_dark2 = Border.all(color: AppColors.dark2, width: 1);
  static Border b_2px_bgLightBlue = Border.all(color: AppColors.bgLightBlue, width: 2);

  static Border by_1px_grey4 = const Border(
      top: BorderSide(
        color: AppColors.grey4,
        width: 1,
      ),
    bottom: BorderSide(
      color: AppColors.grey4,
      width: 1,
    ),
  );

  static Border bt_1px_grey4 = const Border(
      top: BorderSide(
        color: AppColors.grey4,
        width: 1,
      ));
  static Border bt_1px_grey2 = const Border(
      top: BorderSide(
        color: AppColors.grey2,
        width: 1,
      ));
  static Border bt_1px_bgLightBlue = const Border(
      top: BorderSide(
        color: AppColors.bgLightBlue,
        width: 1,
      ));
  static Border bt_2px_bgLightBlue = const Border(
      top: BorderSide(
        color: AppColors.bgLightBlue,
        width: 2,
      ));
  static Border bt_6px_bgPrimary = const Border(
      top: BorderSide(
        color: AppColors.bgPrimary,
        width: 6,
      ));
  static Border bt_6px_bgLightBlue = const Border(
      top: BorderSide(
        color: AppColors.bgLightBlue,
        width: 6,
      ));
  static Border bt_6px_transparent = const Border(
      top: BorderSide(
        color: AppColors.transparent,
        width: 6,
      ));

  static Border bb_1px_grey1 = const Border(
      bottom: BorderSide(
        color: Color(0xFFEAEAEA),
        width: 1,
      ));
  static Border bb_1px_grey4 = const Border(
      bottom: BorderSide(
        color: AppColors.grey4,
        width: 1,
      ));
  static Border bbl_1px_normal = const Border(
      left: BorderSide(
          color: Color(0xff000000),
          width: 1
      ),
      bottom: BorderSide(
          color: Color(0xff000000),
          width: 1
      )
  );

}
