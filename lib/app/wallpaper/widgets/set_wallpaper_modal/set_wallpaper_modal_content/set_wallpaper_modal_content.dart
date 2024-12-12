import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';
import '/app/core/modals/base_modal_content/base_modal_content_widget.dart';
import '../set_wallpaper_modal_data.dart';
import 'set_wallpaper_modal_content_controller.dart';
import 'set_wallpaper_modal_content_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class SetWallpaperModalContent
    extends BaseModalContent<
        SetWallpaperModalContentController,
        SetWallpaperModalContentCubit,
        SetWallpaperModalContentState,
        SetWallpaperModalData> {
  String imageUrl;

  SetWallpaperModalContent({Key? key, super.controller, super.onStateChanged, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SetWallpaperModalContentCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          SetWallpaperModalContentCubit,
          SetWallpaperModalContentState>(
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

  @override
  SetWallpaperModalContentCubit createCubitAndAssignToController(
      BuildContext context) {
    SetWallpaperModalContentCubit cubit = SetWallpaperModalContentCubit(
        context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }

}
