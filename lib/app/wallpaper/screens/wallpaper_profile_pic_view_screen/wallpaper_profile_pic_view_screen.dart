import 'package:basic/app/core/models/profile_models.dart';
import 'package:basic/app/wallpaper/services/favourites_profile_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import '../../../core/models/image_models.dart';
import '../../../themes/app_colors.dart';
import '../../services/favourite_service.dart';
import '../../widgets/set_wallpaper_popup/set_wallpaper_popup.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'wallpaper_profile_pic_view_screen_controller.dart';
import 'wallpaper_profile_pic_view_screen_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class WallpaperProfilePicViewScreen
    extends BaseStatelessWidget<WallpaperProfilePicViewScreenController,
        WallpaperProfilePicViewScreenCubit,
        WallpaperProfilePicViewScreenState> {
  final String wallpaperId;
  final List<PImages> images;
  late ValueNotifier<bool> favouriteNotifier;

  WallpaperProfilePicViewScreen(
      {Key? key, super.controller, super.onStateChanged, required this.images, required this.wallpaperId, required this.favouriteNotifier})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int initialIndex =
    images.indexWhere((image) => image.fileId == wallpaperId);
    final PageController pageController =
    PageController(initialPage: initialIndex);
    final ValueNotifier<bool> buttonsVisible = ValueNotifier<bool>(true);

    return BlocProvider<WallpaperProfilePicViewScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          WallpaperProfilePicViewScreenCubit,
          WallpaperProfilePicViewScreenState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return Scaffold(
            backgroundColor: AppColors.dark,
            body: GestureDetector(
              onVerticalDragUpdate: (details) {
                if (details.primaryDelta! > 10) {
                  context.pop();
                }
              },
              onTap: () {
                buttonsVisible.value = !buttonsVisible.value;
              },
              child: PageView.builder(
                controller: pageController,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  // Generate the correct image URL for the current page
                  final currentImage = images[index];
                  final imageUrl =
                      'https://drive.google.com/uc?export=view&id=${currentImage.fileId}';
                  FavoritesProfileService().isFavoriteProfile(imageUrl).then((isFavorite) {
                    favouriteNotifier.value = isFavorite;
                  });

                  return Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Container(
                        height: MediaQuery.sizeOf(context).height,
                        width: MediaQuery.sizeOf(context).width,
                        alignment: Alignment.center,
                        child: CachedNetworkImage(
                          imageUrl: imageUrl,
                          fit: BoxFit.contain,
                          width: double.infinity,
                          height: double.infinity,
                          placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) {
                            return Image.asset(
                              'assets/images/offline_placeholder.png',
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            );
                          },
                          cacheManager: CacheManager(
                            Config(
                              'customCacheKey',
                              stalePeriod: const Duration(days: 7),
                              maxNrOfCacheObjects: 100,
                            ),
                          ),
                        ),
                      ),
                      ValueListenableBuilder<bool>(
                          valueListenable: buttonsVisible,
                          builder: (context, visible, child) {
                            return AnimatedOpacity(
                              opacity: visible ? 1.0 : 0.0,
                              duration: const Duration(milliseconds: 300),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    color: AppColors.transparent05,
                                    padding: edge_insets_x_16_y_24,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconButton(
                                          style: ElevatedButton.styleFrom(
                                            padding: edge_insets_12,
                                            elevation: 5,
                                            shadowColor: AppColors.bgPrimary2,
                                            backgroundColor: AppColors.white,
                                          ),
                                          onPressed: () {
                                            context.pop();
                                          },
                                          icon: Icon(Icons.arrow_back, size: 25,),
                                        ),
                                        IconButton(
                                          style: ElevatedButton.styleFrom(
                                            padding: edge_insets_12,
                                            elevation: 5,
                                            shadowColor: AppColors.bgPrimary2,
                                            backgroundColor: AppColors.white,
                                          ),
                                          onPressed: () async {
                                            final isFavorite = favouriteNotifier.value;
                                            if (isFavorite) {
                                              await FavoritesProfileService().removeFavoriteProfile(imageUrl);
                                            } else {
                                              await FavoritesProfileService().removeFavoriteProfile(imageUrl);
                                            }
                                            favouriteNotifier.value = !isFavorite;
                                          },
                                          icon: ValueListenableBuilder<bool>(
                                            valueListenable: favouriteNotifier,
                                            builder: (context, isFavorite, child) {
                                              return Icon(
                                                isFavorite ? Icons.favorite : Icons.favorite_outline,
                                                size: 25,
                                                color: isFavorite ? Colors.red : Colors.black,
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    color: AppColors.transparent05,
                                    padding: edge_insets_x_16_y_24,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        ValueListenableBuilder(
                                            valueListenable: getCubit(context).isSharingNotifier,
                                            builder: (context, isSharing, child){
                                              return Stack(
                                                alignment: Alignment.centerLeft,
                                                children: [
                                                  IconButton(
                                                    style: ElevatedButton.styleFrom(
                                                        backgroundColor: AppColors.white,
                                                        disabledBackgroundColor:
                                                        AppColors.white,
                                                        padding: edge_insets_12),
                                                    onPressed: isSharing
                                                        ? null
                                                        : () async {
                                                      await getCubit(context).shareImage(imageUrl, context);
                                                    },
                                                    icon: Icon(
                                                      Icons.share,
                                                      size: 30,
                                                    ),
                                                  ),
                                                  if (isSharing)
                                                    Container(
                                                      margin: edge_insets_l_5,
                                                      height: 45,
                                                      width: 45,
                                                      child: CircularProgressIndicator(
                                                        color: AppColors.bgPrimary2,
                                                        strokeWidth: 6,
                                                      ),
                                                    ),
                                                ],
                                              );
                                            }
                                        ),
                                        ValueListenableBuilder<bool>(
                                          valueListenable:
                                          getCubit(context).isDownloadingNotifier,
                                          builder: (context, isDownloading, child) {
                                            return Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                IconButton(
                                                  style: ElevatedButton.styleFrom(
                                                      backgroundColor: AppColors.white,
                                                      disabledBackgroundColor:
                                                      AppColors.white,
                                                      padding: edge_insets_12),
                                                  onPressed: isDownloading
                                                      ? null
                                                      : () async {
                                                    await getCubit(context)
                                                        .downloadImage(
                                                        imageUrl, context);
                                                  },
                                                  icon: Icon(
                                                    Icons.download_outlined,
                                                    size: 40,
                                                  ),
                                                ),
                                                if (isDownloading)
                                                  SizedBox(
                                                    height: 50,
                                                    width: 50,
                                                    child: CircularProgressIndicator(
                                                      color: AppColors.bgPrimary2,
                                                      strokeWidth: 6,
                                                    ),
                                                  ),
                                              ],
                                            );
                                          },
                                        ),
                                        SetWallpaperPopup(imageUrl: imageUrl),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  WallpaperProfilePicViewScreenCubit createCubitAndAssignToController(
      BuildContext context) {
    WallpaperProfilePicViewScreenCubit cubit = WallpaperProfilePicViewScreenCubit(
        context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
