part of 'wallpapers_main_screen_cubit.dart';

@freezed
class WallpapersMainScreenState with _$WallpapersMainScreenState {
  const factory WallpapersMainScreenState.initial({
    required String selectedWidgetName,
    @Default(5) int timerIntervalMinutes,
    GetAllImagesResponse? getAllImagesResponse,
    @Default(BooleanStatus.initial) BooleanStatus getAllImagesStatus,
    List<Images>? imagesData,
    BooleanStatus? imageStatus,
    List<PImages>? pImagesData,
    BooleanStatus? pImageStatus,
    GetAllImagesState? getAllImagesState,
    List<Categories>? categoriesData,
    BooleanStatus? getAllCategoriesStatus,
  }) = _Initial;
}
