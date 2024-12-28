import 'package:basic/app/core/models/profile_models.dart';
import 'package:basic/app/core/widgets/loading_emoji_widget.dart';
import 'package:basic/app/wallpaper/screens/wallpaper_profile_pic_view_screen/wallpaper_profile_pic_view_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import '../../../ads/widgets/ads_banner_ad_widget/ads_banner_ad_widget.dart';
import '../../../core/database/boolean_status.dart';
import '../../../core/logger/log.dart';
import '../../../core/models/image_models.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/fonts.dart';
import '../../../themes/loading_indicator.dart';
import '../../screens/wallpapers_view_screen/wallpapers_view_screen.dart';
import '../../services/favourite_service.dart';
import '../../services/favourites_profile_service.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'wallpapers_get_all_images_profile_pic_controller.dart';
import 'wallpapers_get_all_images_profile_pic_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class WallpapersGetAllImagesProfilePic
    extends BaseStatelessWidget<WallpapersGetAllImagesProfilePicController,
        WallpapersGetAllImagesProfilePicCubit,
        WallpapersGetAllImagesProfilePicState> {
  List<PImages> imagesData;
  BooleanStatus imageStatus;
  VoidCallback? getAllImagesCallback;
  final Map<String, ValueNotifier<bool>> favouriteNotifiers = {};
  WallpapersGetAllImagesProfilePic(
      {Key? key, super.controller, super.onStateChanged, required this.imagesData, required this.imageStatus, this.getAllImagesCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WallpapersGetAllImagesProfilePicCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          WallpapersGetAllImagesProfilePicCubit,
          WallpapersGetAllImagesProfilePicState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
          logger.d(imagesData);
        },
        builder: (context, state) {
          initializeController(context);
          final largeScreen = MediaQuery.sizeOf(context).width > 600;

          return Container(
            child: GridView.builder(
              key: PageStorageKey('pimagesGrid'),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: largeScreen? 3 : 2,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                childAspectRatio: 1,
              ),
              itemCount: imagesData.length + (imagesData.length ~/ 7) + 1,
              itemBuilder: (context, index) {
                double gridItemWidth = largeScreen ? (MediaQuery.of(context).size.width * 0.32) : (MediaQuery.of(context).size.width * 0.48);
                double gridItemHeight = gridItemWidth * (largeScreen ? 1.05 : 1);
                if ((index + 1) % 8 == 0 || index == imagesData.length + (imagesData.length ~/ 7)){
                  return AdsBannerAdWidget(
                    height: gridItemHeight.toInt(),
                    width: gridItemWidth.toInt(),
                  );
                }
                final imageIndex = index - (index ~/ 8);
                final image = imagesData[imageIndex];
                final imageUrl =
                    'https://drive.google.com/uc?export=view&id=${image.fileId}';
                favouriteNotifiers.putIfAbsent(
                    imageUrl, () => ValueNotifier(false));

                FavoritesProfileService()
                    .isFavoriteProfile(imageUrl)
                    .then((isFavorite) {
                  favouriteNotifiers[imageUrl]!.value = isFavorite;
                });
                return InkWell(
                  onTap: () {
                    largeScreen
                        ? showDialog(
                        context: context,
                        builder: (context) {
                          return WallpaperProfilePicViewScreen(
                            wallpaperId: image.fileId.toString(),
                            images: imagesData,
                            favouriteNotifier: favouriteNotifiers[imageUrl]!,
                          );
                        })
                        : showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return WallpaperProfilePicViewScreen(
                              favouriteNotifier: favouriteNotifiers[imageUrl]!,
                              wallpaperId: image.fileId.toString(),
                              images: imagesData);
                        });
                  },
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: borderRadius.br_10,
                          border: borders.b_1px_bgPrimary,
                        ),
                        child: imageUrl.isNotEmpty
                            ? ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            key: ValueKey(image.fileId),
                            imageUrl: imageUrl,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                            placeholder: (context, url) => Center(
                              child: LoadingEmojiWidget(),
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
                                fileService: HttpFileService(),
                                stalePeriod:
                                const Duration(days: 7),
                                maxNrOfCacheObjects: 300,
                              ),
                            ),
                          ),
                        )
                            : Center(
                          child: Text(
                            'No Image',
                            style: TextStyle(
                              fontWeight: Fonts.f500,
                              fontSize: Fonts.fontSize16,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: edge_insets_5,
                        height: 35,
                        width: 35,
                        child: IconButton(
                          padding: edge_insets_0,
                          style: ElevatedButton.styleFrom(
                            elevation: 5,
                            shadowColor: AppColors.bgPrimary2,
                            backgroundColor: AppColors.white,
                          ),
                          onPressed: () async {
                            final notifier = favouriteNotifiers[imageUrl]!;
                            final isFavorite = notifier.value;
                            if (isFavorite) {
                              await FavoritesProfileService().removeFavoriteProfile(imageUrl);
                            } else {
                              await FavoritesProfileService().addFavoriteProfile(imageUrl);
                            }
                            notifier.value = !isFavorite;
                          },
                          icon: ValueListenableBuilder<bool>(
                            valueListenable: favouriteNotifiers[imageUrl]!,
                            builder: (context, isFavorite, child) {
                              return Icon(
                                isFavorite ? Icons.favorite : Icons.favorite_outline,
                                size: 25,
                                color: isFavorite ? Colors.redAccent : Colors.black,
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  @override
  WallpapersGetAllImagesProfilePicCubit createCubitAndAssignToController(
      BuildContext context) {
    WallpapersGetAllImagesProfilePicCubit cubit = WallpapersGetAllImagesProfilePicCubit(
        context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
