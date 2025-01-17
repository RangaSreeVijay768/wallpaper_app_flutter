import 'dart:math';

import 'package:basic/app/ads/widgets/ads_native_ad/ads_native_ad.dart';
import 'package:basic/app/core/database/boolean_status.dart';
import 'package:basic/app/core/models/image_models.dart';
import 'package:basic/app/core/widgets/loading_emoji_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/logger/log.dart';
import '../../../onboarding/screens/onboarding_wallpaper_offline_view_screen/onboarding_wallpaper_offline_view_screen.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/fonts.dart';
import '../../../themes/loading_indicator.dart';
import '../../screens/wallpapers_view_screen/wallpapers_view_screen.dart';
import '../../services/favourite_service.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'wallpapers_get_all_images_controller.dart';
import 'wallpapers_get_all_images_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class WallpapersGetAllImages extends BaseStatelessWidget<
    WallpapersGetAllImagesController,
    WallpapersGetAllImagesCubit,
    WallpapersGetAllImagesState> {
  List<Images> imagesData;
  BooleanStatus imageStatus;
  final ValueNotifier<bool> isConnectedNotifier = ValueNotifier(true);
  VoidCallback? getAllImagesCallback;
  final Map<String, ValueNotifier<bool>> favouriteNotifiers = {};

  WallpapersGetAllImages(
      {Key? key,
      super.controller,
      super.onStateChanged,
      required this.imagesData,
      required this.imageStatus,
      this.getAllImagesCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WallpapersGetAllImagesCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<WallpapersGetAllImagesCubit,
          WallpapersGetAllImagesState>(
        listener: (context, state) async {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          final largeScreen = MediaQuery.sizeOf(context).width > 600;

          return ListView.builder(
            key: PageStorageKey('imagesList'),
            itemCount: (() {
              final totalRows = (imagesData.length / 3).ceil();
              final adRows = (totalRows / 4).ceil();
              return totalRows + adRows;
            })(),
            itemBuilder: (context, index) {
              final isAdRow = (index + 1) % 5 == 0;
              if (isAdRow) {
                return Container(
                  height: 110,
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
                );
              }

              final rowIndex = index - (index ~/ 5);
              final startIndex = rowIndex * 3;
              if (startIndex >= imagesData.length) {
                return SizedBox.shrink();
              }
              final endIndex =
              (startIndex + 3).clamp(0, imagesData.length);
              final rowImages = imagesData.sublist(startIndex, endIndex);

              return Container(
                padding: edge_insets_y_2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: rowImages.map((image) {
                    final imageUrl =
                        'https://drive.google.com/uc?export=view&id=${image.fileId}';
                    favouriteNotifiers.putIfAbsent(
                        imageUrl, () => ValueNotifier(false));

                    FavoritesService()
                        .isFavorite(imageUrl)
                        .then((isFavorite) {
                      favouriteNotifiers[imageUrl]!.value = isFavorite;
                    });

                    return Expanded(
                      child: Container(
                        padding: edge_insets_x_2,
                        child: InkWell(
                          onTap: () {
                            largeScreen
                                ? showDialog(
                              context: context,
                              builder: (context) {
                                return WallpapersViewScreen(
                                  wallpaperId:
                                  image.fileId.toString(),
                                  images: imagesData,
                                  favouriteNotifier:
                                  favouriteNotifiers[imageUrl]!,
                                );
                              },
                            )
                                : showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (context) {
                                return WallpapersViewScreen(
                                  favouriteNotifier:
                                  favouriteNotifiers[imageUrl]!,
                                  wallpaperId:
                                  image.fileId.toString(),
                                  images: imagesData,
                                );
                              },
                            );
                          },
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Container(
                                height: largeScreen ? 300 : 220,
                                decoration: BoxDecoration(
                                  borderRadius: borderRadius.br_5,
                                  border: borders.b_1px_bgPrimary,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: CachedNetworkImage(
                                    key: ValueKey(image.fileId),
                                    imageUrl: imageUrl,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity,
                                    placeholder: (context, url) => Center(
                                      child: LoadingEmojiWidget(),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Image.asset(
                                          'assets/images/offline_placeholder.png',
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          height: double.infinity,
                                        ),
                                    cacheManager: CacheManager(
                                      Config(
                                        'customCacheKey',
                                        fileService: HttpFileService(),
                                        stalePeriod:
                                        const Duration(days: 7),
                                        maxNrOfCacheObjects: 1000,
                                      ),
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
                                    final notifier =
                                    favouriteNotifiers[imageUrl]!;
                                    final isFavorite = notifier.value;
                                    if (isFavorite) {
                                      await FavoritesService()
                                          .removeFavorite(imageUrl);
                                    } else {
                                      await FavoritesService()
                                          .addFavorite(imageUrl);
                                    }
                                    notifier.value = !isFavorite;
                                  },
                                  icon: ValueListenableBuilder<bool>(
                                    valueListenable:
                                    favouriteNotifiers[imageUrl]!,
                                    builder:
                                        (context, isFavorite, child) {
                                      return Icon(
                                        isFavorite
                                            ? Icons.favorite
                                            : Icons.favorite_outline,
                                        size: 25,
                                        color: isFavorite
                                            ? Colors.redAccent
                                            : Colors.black,
                                      );
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              );
            },
          );
        },
      ),
    );
  }

  @override
  WallpapersGetAllImagesCubit createCubitAndAssignToController(
      BuildContext context) {
    WallpapersGetAllImagesCubit cubit =
        WallpapersGetAllImagesCubit(context: context, imagesData: imagesData.where((image) => image.category == '674877e1d6980fffe17f08e2').toList());
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
