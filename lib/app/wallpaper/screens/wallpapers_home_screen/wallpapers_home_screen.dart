import 'package:basic/app/core/database/boolean_status.dart';
import 'package:basic/app/core/models/image_models.dart';
import 'package:basic/app/themes/app_colors.dart';
import 'package:basic/app/wallpaper/widgets/wallpapers_get_all_images/wallpapers_get_all_images.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../categories/widgets/get_all_categories/get_all_categories_controller.dart';
import '../../../core/models/category_models.dart';
import '../../../core/widgets/app_scaffold_basic.dart';
import '../../../images/widgets/get_all_images/get_all_images.dart';
import '../../../images/widgets/get_all_images/get_all_images_controller.dart';
import '../../../onboarding/screens/onboarding_wallpaper_offline_view_screen/onboarding_wallpaper_offline_view_screen.dart';
import '../../../themes/fonts.dart';
import '../../../themes/loading_indicator.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'wallpapers_home_screen_controller.dart';
import 'wallpapers_home_screen_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class WallpapersHomeScreen extends BaseStatelessWidget<
    WallpapersHomeScreenController,
    WallpapersHomeScreenCubit,
    WallpapersHomeScreenState> {
  WallpapersHomeScreen({Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  GetAllImagesController getAllImagesController = GetAllImagesController();
  GetAllCategoriesController getAllCategoriesController =
      GetAllCategoriesController();
  late List<Categories> categoriesData = [];
  late List<Images> imagesData = [];
  late BooleanStatus imageStatus = BooleanStatus.pending;
  final ValueNotifier<bool> isRefreshing = ValueNotifier(false);
  final localImages = [
    'images/image1.jpg',
    'images/image2.jpg',
    'images/image3.jpg',
    'images/image4.jpg',
    'images/image5.jpg',
    'images/image6.jpg',
    'images/image7.jpg',
    'images/image8.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WallpapersHomeScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<WallpapersHomeScreenCubit, WallpapersHomeScreenState>(
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
              "HD Wallpapers",
              style: TextStyle(color: AppColors.grey3),
            ),
            appBarActionButton: Row(
              children: [
                ValueListenableBuilder<bool>(
                  valueListenable: isRefreshing,
                  builder: (context, loading, _) {
                    return IconButton(
                      onPressed: loading
                          ? null
                          : () async {
                              try {
                                isRefreshing.value = true;
                                await getAllImagesController
                                    .getChildCubit()
                                    .getAllImages(
                                      getAllImagesController
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
                  GetAllImagesNoTemplate(
                    controller: getAllImagesController,
                    onImagesLoaded: (images) {
                      imagesData = images.images!;
                      getCubit(context).emitState(
                        state.copyWith(imagesData: images.images),
                      );
                    },
                    imagesStatus: (status) {
                      imageStatus = status;
                      getCubit(context)
                          .emitState(state.copyWith(imageStatus: status));
                    },
                  ),
                  Expanded(
                    child: imagesData.isNotEmpty
                        ? WallpapersGetAllImages(
                            imagesData: imagesData,
                            imageStatus: imageStatus,
                            getAllImagesCallback: () async {
                              await getAllImagesController
                                  .getChildCubit()
                                  .getAllImages(
                                    getAllImagesController
                                        .getChildCubit()
                                        .createRequestData(),
                                  );
                            },
                          )
                        : imageStatus == BooleanStatus.error
                            ? Container(
                                child: Column(
                                  children: [
                                    Text(
                                      "Can't reach to network",
                                      style: TextStyle(
                                          fontSize: Fonts.fontSize16,
                                          color: AppColors.grey3),
                                    ),
                                    Text(
                                      "Connect to network and reload",
                                      style: TextStyle(color: AppColors.grey3),
                                    ),
                                    OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        side: BorderSide(
                                            color: AppColors.bgPrimary),
                                      ),
                                      onPressed: () async {
                                        await getAllImagesController
                                            .getChildCubit()
                                            .getAllImages(getAllImagesController
                                                .getChildCubit()
                                                .createRequestData());
                                      },
                                      child: Text("Reload"),
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Explore some offline images...",
                                        style: TextStyle(
                                          fontSize: Fonts.fontSize18,
                                          fontWeight: Fonts.f500,
                                          color: AppColors.grey3,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: GridView.builder(
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 4,
                                          mainAxisSpacing: 4,
                                          childAspectRatio: 1,
                                        ),
                                        itemCount: localImages.length,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              largeScreen
                                                  ? showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return OnboardingWallpaperOfflineViewScreen(
                                                          wallpaperId:
                                                              localImages[
                                                                  index],
                                                          images: localImages,
                                                        );
                                                      },
                                                    )
                                                  : showModalBottomSheet(
                                                      context: context,
                                                      isScrollControlled: true,
                                                      builder: (context) {
                                                        return OnboardingWallpaperOfflineViewScreen(
                                                          wallpaperId:
                                                              localImages[
                                                                  index],
                                                          images: localImages,
                                                        );
                                                      },
                                                    );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    borderRadius.br_10,
                                                border: borders.b_1px_bgPrimary,
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.asset(
                                                  localImages[index],
                                                  fit: BoxFit.cover,
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Center(
                                child: LoadingIndicator.loading(context),
                              ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  WallpapersHomeScreenCubit createCubitAndAssignToController(
      BuildContext context) {
    WallpapersHomeScreenCubit cubit =
        WallpapersHomeScreenCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
