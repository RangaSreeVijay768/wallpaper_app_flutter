part of 'wallpapers_favourite_screen_cubit.dart';

@freezed
class WallpapersFavouriteScreenState with _$WallpapersFavouriteScreenState {
  const factory WallpapersFavouriteScreenState.initial({
    List<String>? favourites,
    List<String>? favoriteProfiles
}) = _Initial;
}
