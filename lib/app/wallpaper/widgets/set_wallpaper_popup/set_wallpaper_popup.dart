import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:basic/app/core/database/boolean_status.dart';
import 'package:basic/app/core/modals/popup_data.dart';
import '/app/themes/borders.dart';
import '/app/themes/app_colors.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';
import '/app/core/modals/base_modal/base_modal_widget.dart';
import 'set_wallpaper_popup_content/set_wallpaper_popup_content.dart';
import 'set_wallpaper_popup_controller.dart';
import 'set_wallpaper_popup_cubit.dart';
import 'set_wallpaper_popup_data.dart';

import '/app/core/widgets/base_stateless_widget.dart';
import 'package:basic/app/core/modals/base_alert_popup/base_alert_popup.dart';

class SetWallpaperPopup
    extends BaseAlertPopupWidget<SetWallpaperPopupController,
        SetWallpaperPopupCubit,
        SetWallpaperPopupState,
        SetWallpaperPopupData> {
  String imageUrl;
  SetWallpaperPopup(
      {Key? key, super.controller, super.onStateChanged, super.onPopupClosed, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SetWallpaperPopupCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<SetWallpaperPopupCubit, SetWallpaperPopupState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return Container(
            child: IconButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.white,
                    disabledBackgroundColor:
                    AppColors.white,
                    padding: edge_insets_12),
                onPressed: (){
                  openPopup(context: context, cubit: getCubit(context));
                },
                icon: Icon(Icons.wallpaper, size: 30,)
            ),
          );
        },
      ),
    );
  }

  @override
  SetWallpaperPopupCubit createCubitAndAssignToController(
      BuildContext context) {
    SetWallpaperPopupCubit cubit = SetWallpaperPopupCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }

  @override
  Widget getPopupContentWidget({required BuildContext context}) {
    return SetWallpaperPopupContent(imageUrl: imageUrl);
  }
}
