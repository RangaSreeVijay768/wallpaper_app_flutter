import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'wallpapers_settings_screen_state.dart';

part 'wallpapers_settings_screen_cubit.freezed.dart';

class WallpapersSettingsScreenCubit
    extends BaseCubit<WallpapersSettingsScreenState> {
  WallpapersSettingsScreenCubit({required super.context})
      : super(initialState: WallpapersSettingsScreenState.initial(isTimerEnabled: false, interval: 30, isMinutesUnit: true)){
    _loadSwitchState();
  }

  Future<void> _loadSwitchState() async {
    final prefs = await SharedPreferences.getInstance();
    final isTimerEnabled = prefs.getBool('isTimerEnabled') ?? false;
    final interval = prefs.getInt('wallpaper_interval') ?? 30;
    emitState(state.copyWith(isTimerEnabled: isTimerEnabled, interval: interval));
    if(interval > 120){
      emitState(state.copyWith(isMinutesUnit: false));
    }
  }

}
