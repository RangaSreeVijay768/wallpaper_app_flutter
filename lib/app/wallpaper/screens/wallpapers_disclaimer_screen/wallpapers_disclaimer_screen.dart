import 'package:basic/app/ads/widgets/ads_banner_ad_widget/ads_banner_ad_widget.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../../ads/widgets/ads_native_ad/ads_native_ad.dart';
import '../../../themes/app_colors.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'wallpapers_disclaimer_screen_controller.dart';
import 'wallpapers_disclaimer_screen_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class WallpapersDisclaimerScreen extends BaseStatelessWidget<
    WallpapersDisclaimerScreenController,
    WallpapersDisclaimerScreenCubit,
    WallpapersDisclaimerScreenState> {
  WallpapersDisclaimerScreen({Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final largeScreen = MediaQuery.sizeOf(context).width > 600;

    return BlocProvider<WallpapersDisclaimerScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<WallpapersDisclaimerScreenCubit,
          WallpapersDisclaimerScreenState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return Scaffold(
            backgroundColor: AppColors.dark,
            appBar: AppBar(
              backgroundColor: AppColors.dark,
              title: Text(
                "Disclaimer",
                textAlign: TextAlign.justify,
                style: TextStyle(color: AppColors.grey3),
              ),
              centerTitle: true,
              leading: IconButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.grey3,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back),
              ),
            ),
            body: Container(
              padding: edge_insets_16,
              child: ListView(
                children: [
                  Text(
                    'Image Attribution and Copyright Disclaimer',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.grey6,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '1. Copyright Compliance:',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: AppColors.grey6,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'This app uses images from various third-party sources. The developer does not claim ownership of any images that are copyrighted. The images included are for illustrative purposes only, and the rights to these images belong to their respective copyright holders.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: AppColors.grey6, fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '2. Fair Use Disclaimer:',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: AppColors.grey6,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Some images used in this app may fall under "Fair Use" for educational, non-commercial, or other specific purposes. If you are the owner of any image used in this app and wish to request its removal or proper attribution, please contact us.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: AppColors.grey6, fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '3. Request for Image Removal:',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: AppColors.grey6,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'If you believe any images used in this app infringe on your copyrights, please contact us at [ ranga.wallpaperapp@gmail.com ] with the subject line "Copyright Infringement" and provide the necessary details. We will promptly address your concern.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: AppColors.grey6, fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'By using this app, you agree to the terms and conditions set forth in this disclaimer.',
                    style: TextStyle(color: AppColors.grey6, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: AdsNativeAd(templateType: TemplateType.medium)
                      ),
                      largeScreen?
                      Expanded(
                          child: AdsNativeAd(templateType: TemplateType.medium)
                      ) : SizedBox.shrink()
                    ],
                  )
                ],
              ),
            ),
            bottomNavigationBar: Container(
              height: 65,
              child: AdsBannerAdWidget(),
            ),
          );
        },
      ),
    );
  }

  @override
  WallpapersDisclaimerScreenCubit createCubitAndAssignToController(
      BuildContext context) {
    WallpapersDisclaimerScreenCubit cubit =
        WallpapersDisclaimerScreenCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
