part of 'wallpapers_categories_screen_cubit.dart';

@freezed
class WallpapersCategoriesScreenState with _$WallpapersCategoriesScreenState {
  const factory WallpapersCategoriesScreenState.initial({
    List<Categories>? categoriesData,
    BooleanStatus? getAllCategoriesStatus,
}) = _Initial;
}
