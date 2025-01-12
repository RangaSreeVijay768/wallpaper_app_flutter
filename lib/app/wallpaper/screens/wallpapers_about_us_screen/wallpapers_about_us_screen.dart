import 'package:basic/app/ads/widgets/ads_banner_ad_widget/ads_banner_ad_widget.dart';
import 'package:basic/app/themes/app_colors.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../../ads/widgets/ads_native_ad/ads_native_ad.dart';
import '../../../themes/fonts.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'wallpapers_about_us_screen_controller.dart';
import 'wallpapers_about_us_screen_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class WallpapersAboutUsScreen extends BaseStatelessWidget<
    WallpapersAboutUsScreenController,
    WallpapersAboutUsScreenCubit,
    WallpapersAboutUsScreenState> {
  WallpapersAboutUsScreen({Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WallpapersAboutUsScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<WallpapersAboutUsScreenCubit,
          WallpapersAboutUsScreenState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          final largeScreen = MediaQuery.sizeOf(context).width > 600;
          return Scaffold(
            backgroundColor: AppColors.dark,
            appBar: AppBar(
              backgroundColor: AppColors.dark,
              title: Text(
                "About us",
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
            body: SingleChildScrollView(
              padding: edge_insets_x_10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    padding: edge_insets_x_16_t_16,
                    // margin: edge_insets_y_16,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/app-bg-image.jpg"),
                            fit: BoxFit.fill)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: ClipRRect(
                            borderRadius: borderRadius.br_20,
                            child: Image.asset(
                              "images/app-logo.png",
                              width: 90,
                              height: 90,
                            ),
                          ),
                        ),
                        Container(
                          margin: edge_insets_t_8,
                          child: Text(
                            "Wallpapers 2K25",
                            style: TextStyle(
                                fontSize: Fonts.fontSize16,
                                color: AppColors.grey6),
                          ),
                        ),
                        Container(
                          child: Text(
                            "(Auto changer)",
                            style: TextStyle(
                                // fontSize: Fonts.fontSize16,
                                color: AppColors.grey6),
                          ),
                        ),
                        Container(
                          margin: edge_insets_t_16,
                          child: Text(
                            "version: 1.0.0",
                            style: TextStyle(color: AppColors.grey6),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "About the App",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.grey6
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Wallpapers 2K25 is an innovative and easy-to-use app designed to provide users with a diverse range of high-quality wallpapers. Featuring an auto-change wallpaper functionality, this app ensures that your device screen remains fresh and exciting with minimal effort. The app also offers customization options to tailor your wallpaper experience to your preferences.",
                    style: TextStyle(fontSize: 16, color: AppColors.grey6),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Developer Connect",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.grey6),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        "Name: ",
                        style: TextStyle(fontSize: 16, color: AppColors.grey6),
                      ),
                      Text(
                        " Ranga Sree Vijay",
                        style: TextStyle(fontSize: 20, fontWeight: Fonts.f500, color: AppColors.grey6),
                      ),
                    ],
                  ),
                  SizedBox(height: 2),
                  Text(
                    "This app was designed, developed, maintained by me, with a commitment to create seamless user experiences.",
                    style: TextStyle(fontSize: 16, color: AppColors.grey6),
                    textAlign: TextAlign.justify,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            style: IconButton.styleFrom(
                                backgroundColor: AppColors.bgPrimary01
                            ),
                            onPressed: () {
                              getCubit(context).sendFeedback();
                            },
                            icon: Icon(Icons.mail, color: AppColors.grey6,)),
                        IconButton(
                          style: IconButton.styleFrom(
                            backgroundColor: AppColors.bgPrimary01
                          ),
                            onPressed: () {
                              getCubit(context).viewLinkedin();
                            },
                            icon: FaIcon(FontAwesomeIcons.linkedin, color: AppColors.grey6,))
                      ],
                    ),
                  ),
                  SizedBox(height: 32,),
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
  WallpapersAboutUsScreenCubit createCubitAndAssignToController(
      BuildContext context) {
    WallpapersAboutUsScreenCubit cubit =
        WallpapersAboutUsScreenCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
