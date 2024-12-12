import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/app/core/widgets/base_stateless_widget.dart';
import 'ads_test_modal_widget_content_controller.dart';
import 'ads_test_modal_widget_content_cubit.dart';

class AdsTestModalWidgetContent extends BaseStatelessWidget<
    AdsTestModalWidgetContentController, AdsTestModalWidgetContentCubit, AdsTestModalWidgetContentState> {
  const AdsTestModalWidgetContent({Key? key, super.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AdsTestModalWidgetContentCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<AdsTestModalWidgetContentCubit,
          AdsTestModalWidgetContentState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Container();
        },
      ),
    );
  }

  @override
  AdsTestModalWidgetContentCubit createCubitAndAssignToController(
      BuildContext context) {
    AdsTestModalWidgetContentCubit cubit = AdsTestModalWidgetContentCubit();
    controller?.cubit = cubit;
    return cubit;
  }
}
