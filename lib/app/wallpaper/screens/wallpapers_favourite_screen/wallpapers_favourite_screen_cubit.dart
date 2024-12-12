import 'package:basic/app/wallpaper/services/favourites_profile_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../services/favourite_service.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'wallpapers_favourite_screen_state.dart';

part 'wallpapers_favourite_screen_cubit.freezed.dart';

class WallpapersFavouriteScreenCubit
    extends BaseCubit<WallpapersFavouriteScreenState> {
  late FavoritesService favoritesService;
  late FavoritesProfileService favoritesProfileService;
  WallpapersFavouriteScreenCubit({required super.context})
      : super(initialState: WallpapersFavouriteScreenState.initial()){
    favoritesService=GetIt.instance<FavoritesService>();
    favoritesProfileService=GetIt.instance<FavoritesProfileService>();
    getAllFavourites();
    getAllFavouriteProfiles();
  }


  Future<void> getAllFavourites() async {
    return favoritesService.getFavorites().then((value) {
      emit(state.copyWith(favourites: value));
    });
  }

  Future<void> getAllFavouriteProfiles() async {
    return favoritesProfileService.getFavoriteProfiles().then((value) {
      emit(state.copyWith(favoriteProfiles: value));
    });
  }

}
