import 'dart:async';
import 'package:basic/app/ads/widgets/ads_native_ad/ads_native_ad.dart';
import 'package:basic/app/core/logger/log.dart';
import 'package:basic/app/images/widgets/get_all_images/get_all_images_controller.dart';
import 'package:basic/app/themes/fonts.dart';
import 'package:basic/app/themes/toast.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/database/boolean_status.dart';
import '../../../core/models/image_models.dart';
import '../../../core/widgets/app_scaffold_basic.dart';
import '../../../themes/app_colors.dart';
import '../../widgets/autoset_rules_modal/autoset_rules_modal.dart';
import '../wallpapers_settings_screen/wallpapers_settings_screen.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'wallpapers_auto_set_screen_controller.dart';
import 'wallpapers_auto_set_screen_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class WallpapersAutoSetScreen extends BaseStatelessWidget<
    WallpapersAutoSetScreenController,
    WallpapersAutoSetScreenCubit,
    WallpapersAutoSetScreenState> {
  VoidCallback? initializeTimerAgain;

  WallpapersAutoSetScreen(
      {Key? key,
      super.controller,
      super.onStateChanged,
      this.initializeTimerAgain})
      : super(key: key);
  late List<Images> imagesData = [];
  late BooleanStatus imageStatus = BooleanStatus.pending;
  GetAllImagesController getAllImagesController = GetAllImagesController();
  TextEditingController timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WallpapersAutoSetScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<WallpapersAutoSetScreenCubit,
          WallpapersAutoSetScreenState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          final largeScreen = MediaQuery.sizeOf(context).width > 600;
          return AppScaffoldBasic(
            appBarTitle: Text(
              "Auto Set Wallpaper",
              style: TextStyle(color: AppColors.grey3),
            ),
            appBarActionButton: IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => WallpapersSettingsScreen()));
                },
                icon: Icon(Icons.settings)
            ),
            body: SingleChildScrollView(
              child: Container(
                margin: edge_insets_16,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: borders.b_2px_bgLightBlue,
                          borderRadius: borderRadius.br_10),
                      child: SwitchListTile(
                        activeColor: AppColors.green,
                        title: Text(
                          state.isTimerEnabled == false
                              ? "Turn on Auto wallpaper"
                              : "Auto wallpaper turned on",
                          style: TextStyle(color: AppColors.grey3),
                        ),
                        value: state.isTimerEnabled,
                        onChanged: state.selectedScreens.isEmpty
                            ? null
                            : (value) async {
                          final service = FlutterBackgroundService();

                          if (value) {
                            final hasInternet = await getCubit(context).checkInternetConnection();
                            if (!hasInternet) {
                              ShowToast.toast("No internet connection available.", Colors.redAccent);
                              return;
                            }
                            try {
                              final prefs = await SharedPreferences.getInstance();
                              await prefs.setBool('isTimerEnabled', value);
                              getCubit(context).emitState(state.copyWith(isTimerEnabled: value));
                            } finally {
                              // Initialize the background service
                              Future.delayed(Duration(seconds: 1)).then((_) {
                                getCubit(context).initializeBackgroundService();
                              });
                            }
                          } else {
                            try {
                              final prefs = await SharedPreferences.getInstance();
                              await prefs.setBool('isTimerEnabled', value);
                              getCubit(context).emitState(state.copyWith(isTimerEnabled: value));
                            } finally {
                              // Stop the background service
                              service.invoke("stop");
                              ShowToast.toast('Auto wallpaper service stopped', Colors.redAccent);
                            }
                          }
                        },
                      ),
                    ),
                    Container(
                      margin: edge_insets_t_16,
                      decoration: BoxDecoration(
                          color: state.selectedScreens.contains('HOME')
                              ? state.isTimerEnabled != false
                              ? AppColors.grey5
                              : AppColors.green05
                              : AppColors.grey5,
                          borderRadius: borderRadius.br_5,
                          border: state.selectedScreens.contains('HOME')
                              ? borders.b_2px_bgLightBlue
                              : null),
                      child: CheckboxListTile(
                        activeColor: AppColors.bgPrimary2,
                        side: BorderSide(color: AppColors.bgLightBlue, width: 2),
                        onChanged: state.isTimerEnabled != false
                            ? null
                            : (_) async {
                          await getCubit(context).setSelectedScreen('HOME');
                        },
                        title: Text(
                          state.selectedScreens.contains('HOME')
                              ? "Turn off HOME SCREEN"
                              : "Set for HOME SCREEN",
                          style: TextStyle(color: AppColors.white),
                        ),
                        value: state.selectedScreens.contains('HOME'),
                      ),
                    ),
                    Container(
                      margin: edge_insets_t_16,
                      decoration: BoxDecoration(
                          color: state.selectedScreens.contains('LOCK')
                              ? state.isTimerEnabled != false
                              ? AppColors.grey5
                              : AppColors.green05
                              : AppColors.grey5,
                          borderRadius: borderRadius.br_5,
                          border: state.selectedScreens.contains('LOCK')
                              ? borders.b_2px_bgLightBlue
                              : null),
                      child: CheckboxListTile(
                          activeColor: AppColors.bgPrimary2,
                          side:
                          BorderSide(color: AppColors.bgLightBlue, width: 2),
                          value: state.selectedScreens.contains('LOCK'),
                          onChanged: state.isTimerEnabled != false
                              ? null
                              : (_) async {
                            await getCubit(context)
                                .setSelectedScreen('LOCK');
                          },
                          title: Text(
                            state.selectedScreens.contains('LOCK')
                                ? "Turn off LOCK SCREEN"
                                : "Set for LOCK SCREEN",
                            style: TextStyle(color: AppColors.white),
                          )),
                    ),
                    state.isTimerEnabled != false?
                    Container(
                      margin: edge_insets_t_8,
                      child: Text("Changing Wallpaper automatically for every",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                        color: AppColors.grey3
                      ),),
                    ) : SizedBox(),
                    state.isTimerEnabled != false?
                    Container(
                      key: ValueKey(state.interval),
                      child: Text(
                        state.interval! > 60
                            ? "${state.interval! ~/ 60} hrs ${state.interval! % 60} min" // Calculate hours and minutes
                            : "${state.interval} minutes", // Show minutes directly if <= 60
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.grey3,
                          fontSize: Fonts.fontSize18,
                          fontWeight: Fonts.f500,
                        ),
                      ),
                    ) : SizedBox(),
                    Container(
                      height: 110,
                      margin: edge_insets_t_24,
                      decoration:
                      BoxDecoration(borderRadius: borderRadius.br_100),
                      child: Row(
                        children: [
                          Expanded(
                              child: AdsNativeAd(
                                  templateType: TemplateType.small)),
                          largeScreen
                              ? Expanded(
                              child: AdsNativeAd(
                                  templateType: TemplateType.small))
                              : SizedBox.shrink(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: Container(
              margin: edge_insets_b_16,
              child: AutosetRulesModal(),
            ),
          );
        },
      ),
    );
  }

  @override
  WallpapersAutoSetScreenCubit createCubitAndAssignToController(
      BuildContext context) {
    WallpapersAutoSetScreenCubit cubit =
        WallpapersAutoSetScreenCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}




class WallpapersAutoSetScreenNoTemplate extends WallpapersAutoSetScreen {
  WallpapersAutoSetScreenNoTemplate({super.key, super.controller, super.onStateChanged});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WallpapersAutoSetScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<WallpapersAutoSetScreenCubit,
          WallpapersAutoSetScreenState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return Container();
        },
      ),
    );
  }

}
