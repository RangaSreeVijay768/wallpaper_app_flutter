import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/database/boolean_status.dart';

part 'ads_test_modal_widget_state.dart';
part 'ads_test_modal_widget_cubit.freezed.dart';

class AdsTestModalWidgetCubit extends Cubit<AdsTestModalWidgetState> {
  AdsTestModalWidgetCubit() : super(const AdsTestModalWidgetState.initial());
  
  openModal(){
    emit(state.copyWith(modalStatus: BooleanStatus.active));
  }

  closeModal(){
    emit(state.copyWith(modalStatus: BooleanStatus.closed));
  }
}
