import 'package:basic/app/ads/widgets/ads_banner_ad_widget/ads_banner_ad_widget.dart';
import 'package:basic/app/ads/widgets/ads_native_ad/ads_native_ad.dart';
import 'package:basic/app/themes/fonts.dart';
import 'package:basic/app/themes/toast.dart';
import 'package:basic/app/wallpaper/screens/wallpapers_auto_set_screen/wallpapers_auto_set_screen.dart';
import 'package:basic/app/wallpaper/screens/wallpapers_auto_set_screen/wallpapers_auto_set_screen_controller.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../themes/app_colors.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'wallpapers_settings_screen_controller.dart';
import 'wallpapers_settings_screen_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class WallpapersSettingsScreen extends BaseStatelessWidget<
    WallpapersSettingsScreenController,
    WallpapersSettingsScreenCubit,
    WallpapersSettingsScreenState> {
  WallpapersSettingsScreen({Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  TextEditingController timeController = TextEditingController();
  WallpapersAutoSetScreenController wallpapersAutoSetScreenController =
  WallpapersAutoSetScreenController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WallpapersSettingsScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<WallpapersSettingsScreenCubit,
          WallpapersSettingsScreenState>(
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
              centerTitle: true,
              leading: IconButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.grey3,
                ),
                onPressed: () {
                  context.pop();
                },
                icon: Icon(Icons.arrow_back),
              ),
              title: Text(
                'Settings',
                style: TextStyle(color: AppColors.grey3),
              ),
            ),
            body: SingleChildScrollView(
              padding: edge_insets_16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WallpapersAutoSetScreenNoTemplate(
                    controller: wallpapersAutoSetScreenController,
                  ),
                  Container(
                    margin: edge_insets_b_8,
                    child: Text(
                      'Automatic Wallpaper Interval',
                      style: TextStyle(
                          fontSize: Fonts.fontSize18,
                          fontWeight: Fonts.f500,
                          color: AppColors.grey3),
                    ),
                  ),
                  Container(
                    padding: edge_insets_16,
                    decoration: BoxDecoration(
                      border: borders.b_1px_grey4,
                      borderRadius: borderRadius.br_5
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: edge_insets_16,
                          decoration: BoxDecoration(
                            border: borders.b_1px_grey4,
                            borderRadius: borderRadius.br_5,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '${state.isMinutesUnit ? state.interval : (state.interval / 60).toStringAsFixed(1)}',
                                style: TextStyle(
                                    color: AppColors.grey3,
                                    fontSize: Fonts.fontSize24),
                              ),
                              SizedBox(width: 6),
                              Text(
                                state.isMinutesUnit ? "minutes" : "hours",
                                style: TextStyle(
                                  color: AppColors.grey3,
                                  fontSize: Fonts.fontSize16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Slider(
                                  value: state.isMinutesUnit
                                      ? state.interval.toDouble()
                                      : (state.interval / 60),
                                  min: state.isMinutesUnit ? 1 : (1/60),
                                  max: state.isMinutesUnit ? 120 : 24,
                                  label: state.isMinutesUnit
                                      ? '${state.interval} min'
                                      : '${(state.interval / 60).toStringAsFixed(1)} hrs',
                                  activeColor: AppColors.bgPrimary,
                                  inactiveColor: AppColors.grey2,
                                  onChanged: (double value) {
                                    getCubit(context).emitState(
                                      state.copyWith(
                                        interval: state.isMinutesUnit
                                            ? value.toInt()
                                            : (value * 60).toInt(),
                                      ),
                                    );
                                  },
                                )
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ToggleButtons(
                              borderColor: AppColors.grey4,
                              borderRadius: borderRadius.br_10,
                              selectedBorderColor: AppColors.bgPrimary2,
                              isSelected: [
                                state.isMinutesUnit,
                                !state.isMinutesUnit
                              ],
                              onPressed: (index) {
                                bool isMinutesUnit = index == 0;

                                // Convert current interval based on selected unit
                                int normalizedInterval = isMinutesUnit
                                    ? (state.interval > 120 ? 120 : state.interval)
                                    : (state.interval < 60 ? state.interval : (state.interval / 60).round() * 60);

                                getCubit(context).emitState(
                                  state.copyWith(
                                    isMinutesUnit: isMinutesUnit,
                                    interval: isMinutesUnit ? normalizedInterval : state.interval,
                                  ),
                                );
                              },
                              selectedColor: AppColors.bgPrimary,
                              color: AppColors.grey3,
                              children: [
                                Container(
                                  padding: edge_insets_x_10,
                                  child: Text('Minutes'),
                                ),
                                Container(
                                  padding: edge_insets_x_10,
                                  child: Text(' Hours '),
                                ),
                              ],
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: AppColors.bgPrimary,
                                shape: RoundedRectangleBorder(borderRadius: borderRadius.br_5)
                              ),
                              onPressed: () async {
                                final prefs = await SharedPreferences.getInstance();
                                final service = FlutterBackgroundService();
                                await prefs
                                    .setInt('wallpaper_interval', state.interval)
                                    .then((_) {
                                      try{
                                        service.invoke("stop");
                                      } finally {
                                        state.isTimerEnabled != false
                                            ? Future.delayed(Duration(seconds: 2)).then(
                                                (_) async {
                                                  await wallpapersAutoSetScreenController
                                                      .getChildCubit()
                                                      .initializeBackgroundService();
                                            })
                                            : null;
                                      }
                                });
                                ShowToast.toast(
                                    "Updated the timer to ${prefs.getInt('wallpaper_interval')} minutes",
                                    Colors.greenAccent);
                              },
                              child: Text(
                                "Set Timer",
                                style: TextStyle(color: AppColors.white),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 200,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: AdsNativeAd(templateType: TemplateType.medium),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Container(
              height: 60,
              child: AdsBannerAdWidget(),
            ),
          );
        },
      ),
    );
  }

  @override
  WallpapersSettingsScreenCubit createCubitAndAssignToController(
      BuildContext context) {
    WallpapersSettingsScreenCubit cubit =
    WallpapersSettingsScreenCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
