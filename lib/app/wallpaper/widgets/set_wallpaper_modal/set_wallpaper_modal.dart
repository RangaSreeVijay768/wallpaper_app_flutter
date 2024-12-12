import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../themes/app_colors.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';
import '/app/core/modals/base_modal/base_modal_widget.dart';
import 'set_wallpaper_modal_content/set_wallpaper_modal_content.dart';
import 'set_wallpaper_modal_controller.dart';
import 'set_wallpaper_modal_cubit.dart';
import 'set_wallpaper_modal_data.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class SetWallpaperModal
    extends BaseModalWidget<SetWallpaperModalController,
        SetWallpaperModalCubit,
        SetWallpaperModalState,
        SetWallpaperModalData> {
  String imageUrl;
  SetWallpaperModal(
      {Key? key, super.controller, super.onStateChanged, super.onModalClosed, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SetWallpaperModalCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<SetWallpaperModalCubit, SetWallpaperModalState>(
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
                  openModal(context: context, cubit: getCubit(context));
                },
                icon: Icon(Icons.home, size: 40,)
            ),
          );
        },
      ),
    );
  }

  @override
  SetWallpaperModalCubit createCubitAndAssignToController(
      BuildContext context) {
    SetWallpaperModalCubit cubit = SetWallpaperModalCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }

  @override
  Widget getModalContentWidget({required BuildContext context}) {
    return SetWallpaperModalContent(imageUrl: imageUrl);
  }
}
