import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'onboarding_drawer_widget_state.dart';

part 'onboarding_drawer_widget_cubit.freezed.dart';

class OnboardingDrawerWidgetCubit
    extends BaseCubit<OnboardingDrawerWidgetState> {
  OnboardingDrawerWidgetCubit({required super.context})
      : super(initialState: OnboardingDrawerWidgetState.initial());
}
