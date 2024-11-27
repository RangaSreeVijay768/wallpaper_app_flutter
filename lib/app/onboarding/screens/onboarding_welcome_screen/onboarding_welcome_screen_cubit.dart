import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'onboarding_welcome_screen_state.dart';

part 'onboarding_welcome_screen_cubit.freezed.dart';

class OnboardingWelcomeScreenCubit
    extends BaseCubit<OnboardingWelcomeScreenState> {
  OnboardingWelcomeScreenCubit({required super.context})
      : super(initialState: OnboardingWelcomeScreenState.initial());
}
