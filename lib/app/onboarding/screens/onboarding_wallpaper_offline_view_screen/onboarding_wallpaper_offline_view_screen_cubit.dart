import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'onboarding_wallpaper_offline_view_screen_state.dart';

part 'onboarding_wallpaper_offline_view_screen_cubit.freezed.dart';

class OnboardingWallpaperOfflineViewScreenCubit
    extends BaseCubit<OnboardingWallpaperOfflineViewScreenState> {
  OnboardingWallpaperOfflineViewScreenCubit({required super.context}) : super(
      initialState: OnboardingWallpaperOfflineViewScreenState.initial());
}
