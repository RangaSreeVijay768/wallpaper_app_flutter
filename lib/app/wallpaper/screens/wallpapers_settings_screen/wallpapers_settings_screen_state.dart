part of 'wallpapers_settings_screen_cubit.dart';

@freezed
class WallpapersSettingsScreenState with _$WallpapersSettingsScreenState {
  const factory WallpapersSettingsScreenState.initial({
    required bool isTimerEnabled,
    required int interval,
    required bool isMinutesUnit
}) = _Initial;
}
