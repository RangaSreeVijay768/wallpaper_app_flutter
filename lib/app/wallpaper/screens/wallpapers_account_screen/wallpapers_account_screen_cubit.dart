import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'wallpapers_account_screen_state.dart';

part 'wallpapers_account_screen_cubit.freezed.dart';

class WallpapersAccountScreenCubit
    extends BaseCubit<WallpapersAccountScreenState> {
  WallpapersAccountScreenCubit({required super.context})
      : super(initialState: WallpapersAccountScreenState.initial());
}
