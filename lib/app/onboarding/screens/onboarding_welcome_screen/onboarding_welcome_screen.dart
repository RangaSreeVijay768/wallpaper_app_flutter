import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'onboarding_welcome_screen_controller.dart';
import 'onboarding_welcome_screen_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class OnboardingWelcomeScreen
    extends BaseStatelessWidget<OnboardingWelcomeScreenController,
        OnboardingWelcomeScreenCubit,
        OnboardingWelcomeScreenState> {
  OnboardingWelcomeScreen({Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnboardingWelcomeScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          OnboardingWelcomeScreenCubit,
          OnboardingWelcomeScreenState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return Container();
        },
      ),
    );
  }

  @override
  OnboardingWelcomeScreenCubit createCubitAndAssignToController(
      BuildContext context) {
    OnboardingWelcomeScreenCubit cubit = OnboardingWelcomeScreenCubit(
        context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
