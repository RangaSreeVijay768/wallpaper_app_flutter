import 'package:basic/app/images/repos/get_all_images/get_all_images_response.dart';
import 'package:basic/app/onboarding/screens/onboarding_wallpaper_offline_view_screen/onboarding_wallpaper_offline_view_screen.dart';
import 'package:basic/app/themes/edge_insets.dart';
import 'package:basic/app/wallpaper/screens/wallpapers_view_screen/wallpapers_view_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import '../../../core/database/boolean_status.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/fonts.dart';
import '../../../themes/loading_indicator.dart';
import '../../../wallpaper/services/favourite_service.dart';
import '/app/themes/borders.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'get_all_images_controller.dart';
import 'get_all_images_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class GetAllImages extends BaseStatelessWidget<GetAllImagesController,
    GetAllImagesCubit, GetAllImagesState> {
  final ValueNotifier<bool> isConnectedNotifier = ValueNotifier(true);
  VoidCallback? getAllCategories;
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
  final Map<String, ValueNotifier<bool>> favouriteNotifiers = {};

  GetAllImages(
      {Key? key, super.controller, super.onStateChanged, this.getAllCategories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetAllImagesCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<GetAllImagesCubit, GetAllImagesState>(
        listener: (context, state) async {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          final largeScreen = MediaQuery.sizeOf(context).width > 600;

          if (state.getAllImagesStatus == BooleanStatus.error) {
            return Container(
              child: Column(
                children: [
                  Text(
                    "Can't reach to network",
                    style: TextStyle(fontSize: Fonts.fontSize16),
                  ),
                  Text("Connect to network and reload"),
                  OutlinedButton(
                      onPressed: () async {
                        await getCubit(context).getAllImages(
                            getCubit(context).createRequestData());
                        getAllCategories?.call();
                      },
                      child: Text("Reload")),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Explore some offline images...",
                      style: TextStyle(
                          fontSize: Fonts.fontSize18, fontWeight: Fonts.f500),
                    ),
                  ),
                  Expanded(
                    // margin: edge_insets_t_12,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                                        wallpaperId: localImages[index],
                                        images: localImages,
                                      );
                                    },
                                  )
                                : showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) {
                                      return OnboardingWallpaperOfflineViewScreen(
                                        wallpaperId: localImages[index],
                                        images: localImages,
                                      );
                                    },
                                  );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: borderRadius.br_10,
                              border: borders.b_1px_bgPrimary,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
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
            );
          }

          return state.getAllImagesResponse != null
              ? Container(
                  child: GridView.builder(
                    key: PageStorageKey('imagesGrid'),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                      childAspectRatio: 1,
                    ),
                    itemCount: state.getAllImagesResponse!.images!.length,
                    itemBuilder: (context, index) {
                      final image = state.getAllImagesResponse!.images![index];
                      final imageUrl =
                          'https://drive.google.com/uc?export=view&id=${image.fileId}';
                      favouriteNotifiers.putIfAbsent(
                          imageUrl, () => ValueNotifier(false));

                      FavoritesService()
                          .isFavorite(imageUrl)
                          .then((isFavorite) {
                        favouriteNotifiers[imageUrl]!.value = isFavorite;
                      });
                      return InkWell(
                        onTap: () {
                          largeScreen
                              ? showDialog(
                                  context: context,
                                  builder: (context) {
                                    return WallpapersViewScreen(
                                        wallpaperId: image.fileId.toString(),
                                        images: state
                                            .getAllImagesResponse!.images!,
                                      favouriteNotifier: favouriteNotifiers[imageUrl]!,
                                    );
                                  })
                              : showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (context) {
                                    return WallpapersViewScreen(
                                        favouriteNotifier: favouriteNotifiers[imageUrl]!,
                                        wallpaperId: image.fileId.toString(),
                                        images: state
                                            .getAllImagesResponse!.images!);
                                  });
                        },
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              height: 200,
                              width: 200,
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
                                    await FavoritesService().removeFavorite(imageUrl);
                                  } else {
                                    await FavoritesService().addFavorite(imageUrl);
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
                )
              : Center(
                  child: LoadingIndicator.loading(context),
                );
        },
      ),
    );
  }

  @override
  GetAllImagesCubit createCubitAndAssignToController(BuildContext context) {
    GetAllImagesCubit cubit = GetAllImagesCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}

class GetAllImagesNoTemplate extends GetAllImages {
  final Function(GetAllImagesResponse) onImagesLoaded;
  final Function(BooleanStatus) imagesStatus;

  GetAllImagesNoTemplate(
      {super.key,
      super.controller,
      super.onStateChanged,
      super.getAllCategories,
      required this.onImagesLoaded,
      required this.imagesStatus});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetAllImagesCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<GetAllImagesCubit, GetAllImagesState>(
        listener: (context, state) async {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
          if (state.getAllImagesResponse != null) {
            onImagesLoaded(state.getAllImagesResponse!);
          }
          imagesStatus(state.getAllImagesStatus);
        },
        builder: (context, state) {
          initializeController(context);

          return Container();
        },
      ),
    );
  }
}
