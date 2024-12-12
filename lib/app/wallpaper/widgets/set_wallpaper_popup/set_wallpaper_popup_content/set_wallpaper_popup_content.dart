import 'package:basic/app/ads/widgets/ads_banner_ad_widget/ads_banner_ad_widget.dart';
import 'package:basic/app/themes/app_colors.dart';
import 'package:basic/app/themes/shadows.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';
import 'package:basic/app/core/widgets/base_alert_dialog.dart';
import '../set_wallpaper_popup_data.dart';
import 'set_wallpaper_popup_content_controller.dart';
import 'set_wallpaper_popup_content_cubit.dart';
import 'package:basic/app/core/database/boolean_status.dart';
import 'package:basic/app/core/modals/popup_data.dart';

import 'package:basic/app/core/modals/base_alert_popup_content/base_alert_popup_content.dart';
import '/app/core/widgets/base_stateless_widget.dart';

class SetWallpaperPopupContent
    extends BaseAlertPopupContent<SetWallpaperPopupContentController,
        SetWallpaperPopupContentCubit,
        SetWallpaperPopupContentState,
        SetWallpaperPopupData> {
  String imageUrl;
  int screenLocation = 0;
  SetWallpaperPopupContent({Key? key, super.controller, super.onStateChanged, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SetWallpaperPopupContentCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          SetWallpaperPopupContentCubit,
          SetWallpaperPopupContentState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return BaseAlertDialog(
            loadingButton: state.loadingButton!,
            title: 'Set Wallpaper',
            body: Container(
              margin: edge_insets_y_16,
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              boxShadow: [state.screenType == "HOME" ?shadows.bs_primary: shadows.bs_transparent]
                          ),
                          child: TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: AppColors.white,
                                  padding: edge_insets_16,
                                  shape: RoundedRectangleBorder(borderRadius: borderRadius.br_5),
                                  side: BorderSide(
                                      color: state.screenType == "HOME" ? AppColors.bgPrimary2 : AppColors.grey1
                                  )
                              ),
                              onPressed: (){
                                getCubit(context).emitState(state.copyWith(screenType: "HOME"));
                                screenLocation = WallpaperManager.HOME_SCREEN;
                              },
                              child: Text("Home Screen", style: TextStyle(
                                  color: state.screenType == "HOME" ? AppColors.bgPrimary2 : AppColors.grey1
                              ),)
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              boxShadow: [state.screenType == "LOCK" ?shadows.bs_primary: shadows.bs_transparent]
                          ),
                          child: TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: AppColors.white,
                                  padding: edge_insets_16,
                                  shape: RoundedRectangleBorder(borderRadius: borderRadius.br_5),
                                  side: BorderSide(
                                      color: state.screenType == "LOCK" ? AppColors.bgPrimary2 : AppColors.grey1
                                  )
                              ),
                              onPressed: (){
                                getCubit(context).emitState(state.copyWith(screenType: "LOCK"));
                                screenLocation = WallpaperManager.LOCK_SCREEN;
                              },
                              child: Text("Lock Screen", style: TextStyle(
                                  color: state.screenType == "LOCK" ? AppColors.bgPrimary2 : AppColors.grey1
                              ),)
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16,),
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: [state.screenType == "BOTH" ?shadows.bs_primary: shadows.bs_transparent]
                    ),
                    child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.white,
                          padding: edge_insets_16,
                          shape: RoundedRectangleBorder(borderRadius: borderRadius.br_5),
                          side: BorderSide(
                            color: state.screenType == "BOTH" ? AppColors.bgPrimary2 : AppColors.grey1
                          )
                        ),
                        onPressed: (){
                          getCubit(context).emitState(state.copyWith(screenType: "BOTH"));
                          screenLocation = WallpaperManager.BOTH_SCREEN;
                        },
                        child: Text("Set for Both Screens", style: TextStyle(
                            color: state.screenType == "BOTH" ? AppColors.bgPrimary2 : AppColors.grey1
                        ),)
                    ),
                  ),
                ],
              ),
            ),
            submitButtonTitle: "Set Wallpaper",
            onSubmit: (state.screenType == null || state.loadingButton!)
                ? null
                : ()async{
              getCubit(context).setLoadingButtonStatus(true);
              await getCubit(context).setWallpaper(imageUrl, context, screenLocation);
              closePopup(context, PopupData(status: BooleanStatus.success));
            },
            onClosed: () async{
              closePopup(context, PopupData(status: BooleanStatus.closed));
            },
          );
        },
      ),
    );
  }

  @override
  SetWallpaperPopupContentCubit createCubitAndAssignToController(
      BuildContext context) {
    SetWallpaperPopupContentCubit cubit = SetWallpaperPopupContentCubit(
        context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
