import 'package:basic/app/ads/widgets/ads_banner_ad_widget/ads_banner_ad_widget.dart';
import 'package:basic/app/core/widgets/loading_emoji_widget.dart';
import 'package:basic/app/images/repos/get_all_images_by_category/get_all_images_by_category_response.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import '../../../core/database/boolean_status.dart';
import '../../../onboarding/screens/onboarding_wallpaper_offline_view_screen/onboarding_wallpaper_offline_view_screen.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/fonts.dart';
import '../../../themes/loading_indicator.dart';
import '../../../wallpaper/screens/wallpapers_view_screen/wallpapers_view_screen.dart';
import '../../../wallpaper/services/favourite_service.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'get_all_images_by_category_controller.dart';
import 'get_all_images_by_category_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class GetAllImagesByCategory
    extends BaseStatelessWidget<GetAllImagesByCategoryController,
        GetAllImagesByCategoryCubit,
        GetAllImagesByCategoryState> {
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
  String slug;
  GetAllImagesByCategory({Key? key, super.controller, super.onStateChanged, required this.slug})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetAllImagesByCategoryCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          GetAllImagesByCategoryCubit,
          GetAllImagesByCategoryState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          final largeScreen = MediaQuery.sizeOf(context).width > 600;

          if (state.getAllImagesByCategoryStatus == BooleanStatus.error) {
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
                        await getCubit(context).getAllImagesByCategory(
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
                ],
              ),
            );
          }

          if (state.getAllImagesByCategoryResponse != null) {
            state.getAllImagesByCategoryResponse!.images?.shuffle();
          }
          return state.getAllImagesByCategoryResponse != null
              ? Container(
            child: GridView.builder(
              key: PageStorageKey('imagesGrid'),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: largeScreen ? 3 : 2,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                childAspectRatio: 1,
              ),
              itemCount: state.getAllImagesByCategoryResponse!.images!.length +
                  (state.getAllImagesByCategoryResponse!.images!.length ~/ 9),
              itemBuilder: (context, index) {
                double gridItemWidth = largeScreen ? (MediaQuery.of(context).size.width * 0.32) : (MediaQuery.of(context).size.width * 0.48);
                double gridItemHeight = gridItemWidth * (largeScreen ? 1.2 : 1.15);
                if ((index + 1) % 10 == 0) {
                  return Container(
                    alignment: Alignment.center,
                    child: AdsBannerAdWidget(
                      width: gridItemWidth.toInt(),
                      height: gridItemHeight.toInt(),
                    ),
                  );
                }

                // Calculate the image index by excluding ad slots
                final imageIndex = index - (index ~/ 10);
                final image = state.getAllImagesByCategoryResponse!.images![imageIndex];
                final imageUrl =
                    'https://drive.google.com/uc?export=view&id=${image.fileId}';

                favouriteNotifiers.putIfAbsent(imageUrl, () => ValueNotifier(false));

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
                          images: state.getAllImagesByCategoryResponse!.images!,
                          favouriteNotifier: favouriteNotifiers[imageUrl]!,
                        );
                      },
                    )
                        : showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) {
                        return WallpapersViewScreen(
                          favouriteNotifier: favouriteNotifiers[imageUrl]!,
                          wallpaperId: image.fileId.toString(),
                          images: state.getAllImagesByCategoryResponse!.images!,
                        );
                      },
                    );
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
                                stalePeriod: const Duration(days: 7),
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
                      ),
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
  GetAllImagesByCategoryCubit createCubitAndAssignToController(
      BuildContext context) {
    GetAllImagesByCategoryCubit cubit = GetAllImagesByCategoryCubit(
        context: context, slug: slug);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}


class GetAllImagesByCategoryNoTemplate extends GetAllImagesByCategory{
  Function(GetAllImagesByCategoryResponse) onImagesLoaded;
  Function(BooleanStatus) imagesStatus;
  GetAllImagesByCategoryNoTemplate({super.key, super.controller, super.onStateChanged, required super.slug, required this.onImagesLoaded, required this.imagesStatus});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetAllImagesByCategoryCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          GetAllImagesByCategoryCubit,
          GetAllImagesByCategoryState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
          if(state.getAllImagesByCategoryResponse != null){
            onImagesLoaded(state.getAllImagesByCategoryResponse!);
          }
          imagesStatus(state.getAllImagesByCategoryStatus);
        },
        builder: (context, state) {
          initializeController(context);
          return Container();
        },
      ),
    );
  }


}
