import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'wallpapers_disclaimer_screen_state.dart';

part 'wallpapers_disclaimer_screen_cubit.freezed.dart';

class WallpapersDisclaimerScreenCubit
    extends BaseCubit<WallpapersDisclaimerScreenState> {
  WallpapersDisclaimerScreenCubit({required super.context})
      : super(initialState: WallpapersDisclaimerScreenState.initial());
}
