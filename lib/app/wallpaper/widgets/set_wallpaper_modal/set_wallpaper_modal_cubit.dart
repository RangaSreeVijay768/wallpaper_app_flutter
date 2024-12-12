import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';
import '/app/core/modals/base_modal/base_modal_cubit.dart';

part 'set_wallpaper_modal_state.dart';

part 'set_wallpaper_modal_cubit.freezed.dart';

class SetWallpaperModalCubit extends BaseModalCubit<SetWallpaperModalState> {
  SetWallpaperModalCubit({required super.context})
      : super(initialState: SetWallpaperModalState.initial());

  @override
  void closeModal() {
    // TODO: implement closeModal
  }

  @override
  void openModal() {
    emitState(state.copyWith(modalStatus: BooleanStatus.active));
  }

  @override
  void openModalManual() {
    emitState(state.copyWith(modalStatus: BooleanStatus.pending));
  }

}
