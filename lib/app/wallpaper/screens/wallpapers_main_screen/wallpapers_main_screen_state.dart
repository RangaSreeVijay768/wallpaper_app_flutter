part of 'wallpapers_main_screen_cubit.dart';

@freezed
class WallpapersMainScreenState with _$WallpapersMainScreenState {
  const factory WallpapersMainScreenState.initial({
    required String selectedWidgetName,
    @Default(5) int timerIntervalMinutes,
    GetAllImagesResponse? getAllImagesResponse,
    @Default(BooleanStatus.initial) BooleanStatus getAllImagesStatus,
  }) = _Initial;
}
