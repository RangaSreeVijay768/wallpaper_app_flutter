import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ads_test_modal_widget_content_state.dart';
part 'ads_test_modal_widget_content_cubit.freezed.dart';

class AdsTestModalWidgetContentCubit extends Cubit<AdsTestModalWidgetContentState> {
  AdsTestModalWidgetContentCubit() : super(const AdsTestModalWidgetContentState.initial());
}
