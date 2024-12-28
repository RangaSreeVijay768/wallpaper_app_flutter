import 'package:basic/app/core/database/boolean_status.dart';
import 'package:basic/app/core/widgets/loading_emoji_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import '../../../core/models/image_models.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/fonts.dart';
import '../../../themes/loading_indicator.dart';
import '../../screens/wallpapers_view_screen/wallpapers_view_screen.dart';
import '../../services/favourite_service.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'wallpapers_get_all_images_by_category_controller.dart';
import 'wallpapers_get_all_images_by_category_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class WallpapersGetAllImagesByCategory
    extends BaseStatelessWidget<WallpapersGetAllImagesByCategoryController,
        WallpapersGetAllImagesByCategoryCubit,
        WallpapersGetAllImagesByCategoryState> {
  List<Images> images;
  BooleanStatus imageStatus;
  VoidCallback? getAllImagesCallback;
  final Map<String, ValueNotifier<bool>> favouriteNotifiers = {};
  WallpapersGetAllImagesByCategory(
      {Key? key, super.controller, super.onStateChanged, required this.images, required this.imageStatus, this.getAllImagesCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WallpapersGetAllImagesByCategoryCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          WallpapersGetAllImagesByCategoryCubit,
          WallpapersGetAllImagesByCategoryState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          final largeScreen = MediaQuery.sizeOf(context).width > 600;

          if (imageStatus == BooleanStatus.error) {
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
                        getAllImagesCallback?.call();
                      },
                      child: Text("Reload")),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            );
          }

          return images.isNotEmpty
              ? Container(
            child: GridView.builder(
              key: PageStorageKey('categoryImagesGrid'),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                childAspectRatio: 1,
              ),
              itemCount: images.length,
              itemBuilder: (context, index) {
                final image = images[index];
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
                            images: images,
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
                              images: images);
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
  WallpapersGetAllImagesByCategoryCubit createCubitAndAssignToController(
      BuildContext context) {
    WallpapersGetAllImagesByCategoryCubit cubit = WallpapersGetAllImagesByCategoryCubit(
        context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
