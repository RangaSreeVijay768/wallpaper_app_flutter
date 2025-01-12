part of 'wallpapers_auto_set_screen_cubit.dart';

@freezed
class WallpapersAutoSetScreenState with _$WallpapersAutoSetScreenState {
  const factory WallpapersAutoSetScreenState.initial({
    List<Images>? imagesData,
    BooleanStatus? imageStatus,
    @Default(5) int timerIntervalMinutes,
    GetAllImagesState? getAllImagesState,
    int? interval,
    required bool isTimerEnabled,
    required List<String> selectedScreens,
    GetAllImagesResponse? getAllImagesResponse,
    @Default(BooleanStatus.initial) BooleanStatus getAllImagesStatus,
  }) = _Initial;
}
