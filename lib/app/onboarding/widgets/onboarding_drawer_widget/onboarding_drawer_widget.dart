import 'package:basic/app/wallpaper/screens/wallpapers_about_us_screen/wallpapers_about_us_screen.dart';
import 'package:basic/app/wallpaper/screens/wallpapers_disclaimer_screen/wallpapers_disclaimer_screen.dart';
import 'package:basic/app/wallpaper/screens/wallpapers_privacy_policy_screen/wallpapers_privacy_policy_screen.dart';
import 'package:basic/app/wallpaper/screens/wallpapers_settings_screen/wallpapers_settings_screen.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/buttons.dart';
import '../../../themes/fonts.dart';
import '../../../themes/shadows.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'onboarding_drawer_widget_controller.dart';
import 'onboarding_drawer_widget_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class OnboardingDrawerWidget extends BaseStatelessWidget<
    OnboardingDrawerWidgetController,
    OnboardingDrawerWidgetCubit,
    OnboardingDrawerWidgetState> {
  OnboardingDrawerWidget({Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnboardingDrawerWidgetCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<OnboardingDrawerWidgetCubit,
          OnboardingDrawerWidgetState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          final largeScreen = MediaQuery.sizeOf(context).width > 600;
          final landScape =
              MediaQuery.of(context).orientation == Orientation.landscape;
          return Drawer(
            shape: const RoundedRectangleBorder(),
            backgroundColor: AppColors.dark,
            // surfaceTintColor: AppColors.white,
            width: largeScreen ? 300 : MediaQuery.sizeOf(context).width / 1.3,
            child: SingleChildScrollView(
              child: Container(
                // height: landScape ? null : MediaQuery.sizeOf(context).height,
                // margin: edge_insets_x_16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 250,
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
                            alignment: Alignment.centerLeft,
                            margin: edge_insets_t_16,
                            child: IconButton(
                              style: IconButton.styleFrom(
                                  backgroundColor: AppColors.grey2),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: AppColors.textHeading,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: ClipRRect(
                              borderRadius: borderRadius.br_20,
                              child: Image.asset("images/app-logo.png", width: 80, height: 80,),
                            ),
                          ),
                          Container(
                            margin: edge_insets_t_8,
                            child: Text("Wallpapers 2K25", style: TextStyle(
                              fontSize: Fonts.fontSize16,
                              color: AppColors.grey3
                            ),),
                          ),
                          Container(
                            child: Text("(Auto changer)", style: TextStyle(
                                // fontSize: Fonts.fontSize16,
                                color: AppColors.grey3
                            ),),
                          ),
                          Container(
                            margin: edge_insets_t_8,
                            alignment: Alignment.centerRight,
                            child: Text("v1.0.0", style: TextStyle(
                              color: AppColors.grey3
                            ),),
                          )

                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            margin: edge_insets_x_16,
                            decoration: const BoxDecoration(
                                boxShadow: [shadows.bs_grey]),
                            child: Row(
                              children: [
                                Expanded(
                                    child: TextButton(
                                  style: Buttons.sideMenuButton,
                                  onPressed: () {
                                    context.go('/');
                                  },
                                  child: const Row(
                                    children: [
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Icon(
                                        Icons.home_sharp,
                                        color: AppColors.textHeading,
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Text(
                                        "Home",
                                        style: TextStyle(
                                            color: AppColors.textHeading,
                                            fontSize: Fonts.fontSize16,
                                            fontWeight: Fonts.f400),
                                      )
                                    ],
                                  ),
                                ))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            margin: edge_insets_x_16,
                            decoration: const BoxDecoration(
                                boxShadow: [shadows.bs_grey]),
                            child: Row(
                              children: [
                                Expanded(
                                    child: TextButton(
                                  style: Buttons.sideMenuButton,
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => WallpapersSettingsScreen()));
                                  },
                                  child: const Row(
                                    children: [
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Icon(
                                        Icons.settings,
                                        color: AppColors.textHeading,
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Text(
                                        "Settings",
                                        style: TextStyle(
                                            color: AppColors.textHeading,
                                            fontSize: Fonts.fontSize16,
                                            fontWeight: Fonts.f400),
                                      )
                                    ],
                                  ),
                                ))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Divider(height: 2,),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: edge_insets_x_16,
                            child: Text("Other options", style: TextStyle(
                              color: AppColors.grey3
                            ),),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: edge_insets_x_16,
                            decoration:
                            const BoxDecoration(boxShadow: [shadows.bs_grey]),
                            child: Row(
                              children: [
                                Expanded(
                                    child: TextButton(
                                      style: Buttons.sideMenuButton,
                                      onPressed: () {
                                        getCubit(context).rateApp();
                                      },
                                      child: const Row(
                                        children: [
                                          SizedBox(
                                            width: 16,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: AppColors.textHeading,
                                          ),
                                          SizedBox(
                                            width: 16,
                                          ),
                                          Text(
                                            "Rate us",
                                            style: TextStyle(
                                                color: AppColors.textHeading,
                                                fontSize: Fonts.fontSize16,
                                                fontWeight: Fonts.f400),
                                          )
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            margin: edge_insets_x_16,
                            decoration:
                            const BoxDecoration(boxShadow: [shadows.bs_grey]),
                            child: Row(
                              children: [
                                Expanded(
                                    child: TextButton(
                                      style: Buttons.sideMenuButton,
                                      onPressed: () {
                                        getCubit(context).shareApp();
                                      },
                                      child: const Row(
                                        children: [
                                          SizedBox(
                                            width: 16,
                                          ),
                                          Icon(
                                            Icons.share,
                                            color: AppColors.textHeading,
                                          ),
                                          SizedBox(
                                            width: 16,
                                          ),
                                          Text(
                                            "Share App",
                                            style: TextStyle(
                                                color: AppColors.textHeading,
                                                fontSize: Fonts.fontSize16,
                                                fontWeight: Fonts.f400),
                                          )
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            margin: edge_insets_x_16,
                            decoration:
                            const BoxDecoration(boxShadow: [shadows.bs_grey]),
                            child: Row(
                              children: [
                                Expanded(
                                    child: TextButton(
                                      style: Buttons.sideMenuButton,
                                      onPressed: () {
                                        getCubit(context).sendFeedback();
                                      },
                                      child: const Row(
                                        children: [
                                          SizedBox(
                                            width: 16,
                                          ),
                                          Icon(
                                            Icons.feedback_rounded,
                                            color: AppColors.textHeading,
                                          ),
                                          SizedBox(
                                            width: 16,
                                          ),
                                          Text(
                                            "Give feedback",
                                            style: TextStyle(
                                                color: AppColors.textHeading,
                                                fontSize: Fonts.fontSize16,
                                                fontWeight: Fonts.f400),
                                          )
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            margin: edge_insets_x_16,
                            decoration:
                            const BoxDecoration(boxShadow: [shadows.bs_grey]),
                            child: Row(
                              children: [
                                Expanded(
                                    child: TextButton(
                                      style: Buttons.sideMenuButton,
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => WallpapersAboutUsScreen()));
                                      },
                                      child: const Row(
                                        children: [
                                          SizedBox(
                                            width: 16,
                                          ),
                                          Icon(
                                            Icons.person,
                                            color: AppColors.textHeading,
                                          ),
                                          SizedBox(
                                            width: 16,
                                          ),
                                          Text(
                                            "About us",
                                            style: TextStyle(
                                                color: AppColors.textHeading,
                                                fontSize: Fonts.fontSize16,
                                                fontWeight: Fonts.f400),
                                          )
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            margin: edge_insets_x_16,
                            decoration:
                            const BoxDecoration(boxShadow: [shadows.bs_grey]),
                            child: Row(
                              children: [
                                Expanded(
                                    child: TextButton(
                                      style: Buttons.sideMenuButton,
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => WallpapersDisclaimerScreen()));
                                      },
                                      child: const Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Disclaimer",
                                            style: TextStyle(
                                                color: AppColors.textHeading,
                                                fontSize: Fonts.fontSize16,
                                                fontWeight: Fonts.f400),
                                          )
                                        ],
                                      ),
                                    )),
                                SizedBox(width: 10,),
                                Expanded(
                                    child: TextButton(
                                      style: Buttons.sideMenuButton,
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => WallpapersPrivacyPolicyScreen()));
                                      },
                                      child: const Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Privacy Policy",
                                            style: TextStyle(
                                                color: AppColors.textHeading,
                                                fontSize: Fonts.fontSize16,
                                                fontWeight: Fonts.f400),
                                          )
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  OnboardingDrawerWidgetCubit createCubitAndAssignToController(
      BuildContext context) {
    OnboardingDrawerWidgetCubit cubit =
        OnboardingDrawerWidgetCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
