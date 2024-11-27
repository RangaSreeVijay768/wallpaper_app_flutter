part of 'base_alert_popup_cubit.dart';

@freezed
class BaseAlertPopupState with _$BaseAlertPopupState {
  const factory BaseAlertPopupState.initial({
    @Default(BooleanStatus.active) BooleanStatus popupStatus,
  }) = _Initial;
}
