import 'package:basic/app/core/widgets/app_scaffold_basic.dart';
import 'package:basic/app/themes/loading_indicator.dart';
import 'package:basic/app/wallpaper/screens/wallpapers_favourite_view_screen/wallpapers_favourite_view_screen.dart';
import 'package:basic/app/wallpaper/services/favourite_service.dart';
import 'package:basic/app/wallpaper/widgets/wallpaper_get_all_favorite_profiles/wallpaper_get_all_favorite_profiles.dart';
import 'package:basic/app/wallpaper/widgets/whatsapp_get_all_favorites/whatsapp_get_all_favorites.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/fonts.dart';
import '../wallpapers_view_screen/wallpapers_view_screen.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'wallpapers_favourite_screen_controller.dart';
import 'wallpapers_favourite_screen_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class WallpapersFavouriteScreen
    extends BaseStatelessWidget<WallpapersFavouriteScreenController,
        WallpapersFavouriteScreenCubit,
        WallpapersFavouriteScreenState> {
  VoidCallback? updateFavorites;
  WallpapersFavouriteScreen({Key? key, super.controller, super.onStateChanged, this.updateFavorites})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WallpapersFavouriteScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          WallpapersFavouriteScreenCubit,
          WallpapersFavouriteScreenState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return DefaultTabController(
            length: 2,
            child: AppScaffoldBasic(
              appBarHeight: Size.fromHeight(90),
              appBarTitle: Text("Your Favorites", style: TextStyle(
                color: AppColors.grey3
              ),),
              // appBarActionButton: IconButton(
              //     onPressed: (){
              //       state.favourites?.shuffle();
              //       state.favoriteProfiles?.shuffle();
              //     },
              //     icon: Icon(Icons.shuffle)
              // ),
              bottom: TabBar(
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 0,
                indicatorColor: AppColors.bgLightBlue,
                indicator: BoxDecoration(
                  color: AppColors.dark2,
                  border: borders.b_2px_bgLightBlue,
                  borderRadius: borderRadius.br_10
                ),
                labelColor: AppColors.bgLightBlue,
                unselectedLabelColor: AppColors.grey3,
                tabAlignment: TabAlignment.center,
                padding: edge_insets_0,
                tabs: <Widget>[
                  Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: 45,
                      alignment: Alignment.center,
                      child: const Text(
                        "Wallpapers",
                        style: TextStyle(
                          // color: AppColors.grey3,
                            fontWeight: Fonts.f600,
                            fontSize: Fonts.fontSize16),
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: 45,
                      alignment: Alignment.center,
                      child: const Text(
                        "Profile pic",
                        style: TextStyle(
                            // color: AppColors.grey3,
                            fontWeight: Fonts.f600,
                            fontSize: Fonts.fontSize16),
                      )),
                ],
              ),
              body: Container(
                decoration: BoxDecoration(
                  border: borders.bt_1px_grey4,
                ),
                child: TabBarView(
                  children: [
                    WhatsappGetAllFavorites(
                      favourites: state.favourites ?? [],
                      getAllFavouritesCallback: () async {
                        await getCubit(context).getAllFavourites();
                        updateFavorites?.call();
                      },
                    ),
                    WallpaperGetAllFavoriteProfiles(
                      favourites: state.favoriteProfiles ?? [],
                      getAllFavoriteProfilesCallback: () async {
                        await getCubit(context).getAllFavouriteProfiles();
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  WallpapersFavouriteScreenCubit createCubitAndAssignToController(
      BuildContext context) {
    WallpapersFavouriteScreenCubit cubit = WallpapersFavouriteScreenCubit(
        context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
