import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../blocs/base_cubit.dart';
import '../../database/boolean_status.dart';

part 'base_alert_popup_cubit.freezed.dart';
part 'base_alert_popup_state.dart';

abstract class BaseAlertPopupCubit<T> extends BaseCubit<T> {
  BaseAlertPopupCubit({required super.initialState, required super.context});

  void openPopup();

  void closePopup();
}
