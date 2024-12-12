import 'package:basic/app/core/database/boolean_status.dart';
import 'package:basic/app/core/logger/log.dart';
import 'package:basic/app/core/models/image_models.dart';
import 'package:basic/app/core/models/profile_models.dart';
import 'package:basic/app/core/widgets/app_scaffold_basic.dart';
import 'package:basic/app/images/widgets/get_all_images_by_category/get_all_images_by_category_controller.dart';
import 'package:basic/app/profile/widgets/get_all_profile_images/get_all_profile_images.dart';
import 'package:basic/app/profile/widgets/get_all_profile_images/get_all_profile_images_controller.dart';
import 'package:basic/app/wallpaper/widgets/wallpapers_get_all_images_by_category/wallpapers_get_all_images_by_category.dart';
import 'package:basic/app/wallpaper/widgets/wallpapers_get_all_images_profile_pic/wallpapers_get_all_images_profile_pic.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../images/widgets/get_all_images_by_category/get_all_images_by_category.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/fonts.dart';
import '../../../themes/loading_indicator.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'wallpapers_profile_pic_screen_controller.dart';
import 'wallpapers_profile_pic_screen_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class WallpapersProfilePicScreen extends BaseStatelessWidget<
    WallpapersProfilePicScreenController,
    WallpapersProfilePicScreenCubit,
    WallpapersProfilePicScreenState> {
  WallpapersProfilePicScreen({Key? key, super.controller, super.onStateChanged})
      : super(key: key);
  List<PImages> imagesData = [];
  BooleanStatus imageStatus = BooleanStatus.pending;
  GetAllProfileImagesController getAllProfileImagesController =
      GetAllProfileImagesController();
  final ValueNotifier<bool> isRefreshing = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WallpapersProfilePicScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<WallpapersProfilePicScreenCubit,
          WallpapersProfilePicScreenState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return AppScaffoldBasic(
            appBarTitle: Text(
              "Profile pictures",
              style: TextStyle(color: AppColors.grey3),
            ),
            appBarActionButton: Row(
              children: [
                ValueListenableBuilder<bool>(
                  valueListenable: isRefreshing,
                  builder: (context, loading, _) {
                    return IconButton(
                      onPressed: loading
                          ? null // Disable button while refreshing
                          : () async {
                              try {
                                isRefreshing.value =
                                    true; // Start loading animation
                                await getAllProfileImagesController
                                    .getChildCubit()
                                    .getAllProfileImages(
                                      getAllProfileImagesController
                                          .getChildCubit()
                                          .createRequestData(),
                                    );
                                imagesData = List.from(imagesData);
                                getCubit(context).emitState(
                                  state.copyWith(
                                      imagesData: List.from(imagesData)),
                                );
                              } finally {
                                isRefreshing.value = false;
                              }
                            },
                      icon: loading
                          ? SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.5,
                                color: AppColors.grey3,
                              ),
                            )
                          : Icon(Icons.refresh),
                    );
                  },
                ),
                IconButton(
                  onPressed: () {
                    imagesData.shuffle();
                    imagesData = List.from(imagesData);
                    getCubit(context).emitState(
                      state.copyWith(imagesData: List.from(imagesData)),
                    );
                  },
                  icon: Icon(Icons.shuffle),
                ),
              ],
            ),
            body: Container(
              padding: edge_insets_x_8,
              child: Column(
                children: [
                  GetAllProfileImagesNoTemplate(
                    controller: getAllProfileImagesController,
                    onImagesLoaded: (images) {
                      imagesData = images.images!;
                      getCubit(context)
                          .emitState(state.copyWith(imagesData: images.images));
                      logger.d(imagesData);
                    },
                    imagesStatus: (status) {
                      imageStatus = status;
                      getCubit(context)
                          .emitState(state.copyWith(imageStatus: status));
                    },
                  ),
                  Expanded(
                      child: imagesData.isNotEmpty
                          ? WallpapersGetAllImagesProfilePic(
                              imagesData: imagesData,
                              imageStatus: imageStatus,
                              getAllImagesCallback: () async {
                                await getAllProfileImagesController
                                    .getChildCubit()
                                    .getAllProfileImages(
                                        getAllProfileImagesController
                                            .getChildCubit()
                                            .createRequestData());
                              },
                            )
                          : imageStatus == BooleanStatus.error
                              ? Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Can't reach to network",
                                        style: TextStyle(
                                            fontSize: Fonts.fontSize16,
                                            color: AppColors.grey3),
                                      ),
                                      Text(
                                        "Connect to network and reload",
                                        style:
                                            TextStyle(color: AppColors.grey3),
                                      ),
                                      OutlinedButton(
                                          style: OutlinedButton.styleFrom(
                                              side: BorderSide(
                                                  color: AppColors.bgPrimary)),
                                          onPressed: () async {
                                            getAllProfileImagesController
                                                .getChildCubit()
                                                .getAllProfileImages(
                                                    getAllProfileImagesController
                                                        .getChildCubit()
                                                        .createRequestData());
                                          },
                                          child: Text("Reload")),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                )
                              : Center(
                                  child: LoadingIndicator.loading(context),
                                ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  WallpapersProfilePicScreenCubit createCubitAndAssignToController(
      BuildContext context) {
    WallpapersProfilePicScreenCubit cubit =
        WallpapersProfilePicScreenCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
