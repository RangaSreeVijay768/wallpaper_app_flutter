import 'package:basic/app/ads/widgets/ads_banner_ad_widget/ads_banner_ad_widget.dart';
import 'package:basic/app/ads/widgets/ads_native_ad/ads_native_ad.dart';
import 'package:basic/app/core/widgets/loading_emoji_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/fonts.dart';
import '../../../themes/loading_indicator.dart';
import '../../screens/wallpapers_favourite_view_screen/wallpapers_favourite_view_screen.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'whatsapp_get_all_favorites_controller.dart';
import 'whatsapp_get_all_favorites_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class WhatsappGetAllFavorites
    extends BaseStatelessWidget<WhatsappGetAllFavoritesController,
        WhatsappGetAllFavoritesCubit,
        WhatsappGetAllFavoritesState> {
  WhatsappGetAllFavorites({Key? key, super.controller, super.onStateChanged, required this.favourites, this.getAllFavouritesCallback})
      : super(key: key);
  List<String> favourites;
  VoidCallback? getAllFavouritesCallback;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WhatsappGetAllFavoritesCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          WhatsappGetAllFavoritesCubit,
          WhatsappGetAllFavoritesState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          final largeScreen = MediaQuery.sizeOf(context).width > 600;
          if(favourites.isEmpty){
            return Center(
              child: Text("No favorite wallpapers added", style: TextStyle(
                  color: AppColors.grey3,
                  fontSize: Fonts.fontSize16
              ),),
            );
          }
          double gridItemWidth = largeScreen ? (MediaQuery.of(context).size.width * 0.32) : (MediaQuery.of(context).size.width * 0.48);
          double gridItemHeight = gridItemWidth * (largeScreen ? 1.2 : 1.15);
          return favourites.isNotEmpty
              ? Container(
            padding: edge_insets_x_8,
            child: GridView.builder(
              key: PageStorageKey('favoritesGrid'),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: largeScreen ? 3 : 2,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                childAspectRatio: 0.8,
              ),
              itemCount: favourites.length + (favourites.length ~/ 7) + 1, // Add extra slots for ads
              itemBuilder: (context, index) {
                if ((index + 1) % 8 == 0 || index == favourites.length + (favourites.length ~/ 7)) {
                  // Ad slot logic
                  return AdsBannerAdWidget(
                    height: gridItemHeight.toInt(),
                    width: gridItemWidth.toInt(),
                  );
                }

                // Calculate the actual index of the image by removing ads
                final imageIndex = index - (index ~/ 8);
                final imageUrl = favourites[imageIndex];

                return Stack(
                  alignment: Alignment.topRight,
                  children: [
                    InkWell(
                      onTap: () {
                        largeScreen
                            ? showDialog(
                          context: context,
                          builder: (context) {
                            return WallpapersFavouriteViewScreen(
                              wallpaperId: imageUrl,
                              images: favourites,
                            );
                          },
                        ).then((value) {
                          getAllFavouritesCallback?.call();
                        })
                            : showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) {
                            return WallpapersFavouriteViewScreen(
                              wallpaperId: imageUrl,
                              images: favourites,
                            );
                          },
                        ).then((value) {
                          getAllFavouritesCallback?.call();
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: borderRadius.br_10,
                        ),
                        child: imageUrl.isNotEmpty
                            ? ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            key: ValueKey(imageUrl),
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
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      child: IconButton(
                        padding: edge_insets_0,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.white06),
                        icon: Icon(
                          Icons.cancel_outlined,
                          size: 30,
                        ),
                        onPressed: () async {
                          await getCubit(context).deleteFavourite(imageUrl);
                          getAllFavouritesCallback?.call();
                        },
                      ),
                    )
                  ],
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
  WhatsappGetAllFavoritesCubit createCubitAndAssignToController(
      BuildContext context) {
    WhatsappGetAllFavoritesCubit cubit = WhatsappGetAllFavoritesCubit(
        context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
