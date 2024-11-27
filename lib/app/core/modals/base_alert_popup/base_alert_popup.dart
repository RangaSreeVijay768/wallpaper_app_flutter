import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/base_alert_popup_controller.dart';
import '../popup_data.dart';
import '../../widgets/base_stateless_widget.dart';
import 'base_alert_popup_cubit.dart';

abstract class BaseAlertPopupWidget<T extends BaseAlertPopupController,
B extends BaseAlertPopupCubit, S, P> extends BaseStatelessWidget<T, B, S> {
  BaseAlertPopupWidget(
      {Key? key, this.onPopupClosed, super.controller, super.onStateChanged})
      : super(key: key);

  Function(PopupData<P>)? onPopupClosed;

  Future<T?> openPopup<T>(
      {required BuildContext context, required BlocBase cubit}) {
    getCubit(context).openPopup();
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return BlocProvider.value(
            value: cubit,
            child: getPopupContentWidget(context: context),
          );
        }).then((value) {
      getCubit(context).closePopup();
      if (this.onPopupClosed != null) {
        this.onPopupClosed!(value);
      }
      return null;
    });
  }

  Widget getPopupContentWidget({required BuildContext context});
}
