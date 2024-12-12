part of 'wallpapers_home_screen_cubit.dart';

@freezed
class WallpapersHomeScreenState with _$WallpapersHomeScreenState {
  const factory WallpapersHomeScreenState.initial({
    GetAllCategoriesResponse? getAllCategoriesResponse,
    List<Images>? imagesData,
    BooleanStatus? imageStatus,
    GetAllImagesState? getAllImagesState
}) = _Initial;
}
