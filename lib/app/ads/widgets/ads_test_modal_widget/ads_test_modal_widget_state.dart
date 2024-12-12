part of 'ads_test_modal_widget_cubit.dart';

@freezed
class AdsTestModalWidgetState with _$AdsTestModalWidgetState {
  const factory AdsTestModalWidgetState.initial(
      {@Default(BooleanStatus.closed) BooleanStatus modalStatus}) = _Initial;
}

