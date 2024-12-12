import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../themes/app_colors.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';
import '/app/core/modals/base_modal/base_modal_widget.dart';
import 'autoset_rules_modal_content/autoset_rules_modal_content.dart';
import 'autoset_rules_modal_controller.dart';
import 'autoset_rules_modal_cubit.dart';
import 'autoset_rules_modal_data.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class AutosetRulesModal
    extends BaseModalWidget<AutosetRulesModalController,
        AutosetRulesModalCubit,
        AutosetRulesModalState,
        AutosetRulesModalData> {
  AutosetRulesModal(
      {Key? key, super.controller, super.onStateChanged, super.onModalClosed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AutosetRulesModalCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<AutosetRulesModalCubit, AutosetRulesModalState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return Container(
            child: IconButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.grey3,
                    disabledBackgroundColor:
                    AppColors.white,
                    padding: edge_insets_12),
                onPressed: (){
                  openModal(context: context, cubit: getCubit(context));
                },
                icon: Icon(Icons.notes, size: 30,)
            ),
          );
        },
      ),
    );
  }

  @override
  AutosetRulesModalCubit createCubitAndAssignToController(
      BuildContext context) {
    AutosetRulesModalCubit cubit = AutosetRulesModalCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }

  @override
  Widget getModalContentWidget({required BuildContext context}) {
    return AutosetRulesModalContent();
  }
}
