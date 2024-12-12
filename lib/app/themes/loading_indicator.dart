import 'package:basic/app/themes/shadows.dart';
import 'package:flutter/cupertino.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'app_colors.dart';
import 'borders.dart';
import 'fonts.dart';

abstract class LoadingIndicator{
  static Widget loading(BuildContext context) {
    return Container(
      height: 90,
      width: MediaQuery.sizeOf(context).width / 1.5,
      decoration: BoxDecoration(
          boxShadow: const [shadows.bs_primary],
          color: AppColors.white,
          borderRadius: borderRadius.br_10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoadingAnimationWidget.discreteCircle(
              color: AppColors.bgPrimary,
              size: 50,
              secondRingColor: AppColors.bmiTracker,
              thirdRingColor: AppColors.waterPrimary),
          const SizedBox(
            width: 20,
          ),
          Text(
            "Loading \n Please wait",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: Fonts.f500, fontSize: Fonts.fontSize18),
          )
        ],
      ),
    );
  }
}
