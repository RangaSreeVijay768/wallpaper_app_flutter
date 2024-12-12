import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../services/favourites_profile_service.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'wallpaper_get_all_favorite_profiles_state.dart';

part 'wallpaper_get_all_favorite_profiles_cubit.freezed.dart';

class WallpaperGetAllFavoriteProfilesCubit
    extends BaseCubit<WallpaperGetAllFavoriteProfilesState> {
  late FavoritesProfileService favoritesProfileService;
  WallpaperGetAllFavoriteProfilesCubit({required super.context})
      : super(initialState: WallpaperGetAllFavoriteProfilesState.initial()){
    favoritesProfileService=GetIt.instance<FavoritesProfileService>();
  }

  Future<void> deleteFavouriteProfile(String imageUrl) async {
    return favoritesProfileService.removeFavoriteProfile(imageUrl);
  }

}
