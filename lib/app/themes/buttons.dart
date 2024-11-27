import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'edge_insets.dart';
import 'borders.dart';
import 'fonts.dart';

abstract class Buttons {
  static ButtonStyle sideMenuButton = TextButton.styleFrom(
      backgroundColor: AppColors.white,
      padding: edge_insets_y_12,
      shape: RoundedRectangleBorder(borderRadius: borderRadius.br_5));

  static Widget primaryButton(
    String text,
    dynamic onPressed,
  ) {
    return TextButton(
        style: TextButton.styleFrom(
          padding: edge_insets_16,
            backgroundColor: AppColors.bgPrimary),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
              color: AppColors.white, fontSize: Fonts.fontSize16, fontWeight: Fonts.f500),
        ));
  }


  static Widget subjectComponent(String text){
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            border: borders.b_1px_grey4,
            borderRadius: borderRadius.br_10),
        padding: edge_insets_16,
        child: Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
                child: Text(text,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                      fontWeight: Fonts.f500,
                      fontSize: Fonts.fontSize16
                  ),)
            ),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}
