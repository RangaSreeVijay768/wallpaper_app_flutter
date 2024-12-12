import 'package:basic/app/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../widgets/core_toast_success/core_toast_success.dart';

abstract class BaseCubit<State> extends Cubit<State> {
  BuildContext context;
  FToast? fToast;

  BaseCubit({required this.context, required State initialState})
      : super(initialState) {

  }

  emitState(State state) {
    emit(state);
  }

  showErrorMessage(String message) {
    showMessage(message, Icons.close, Colors.redAccent);
  }

  showSuccessMessage(String message){
    showMessage(message, Icons.check, Colors.greenAccent);
  }

  showMessage(String message, IconData icon, Color? color) {
    if (fToast == null) {
      fToast = FToast();
      fToast!.init(context);
    }
    fToast!.showToast(
        child: CoreToastSuccess(
          message: message,
          color: color,
          icon: icon,
        ),
        gravity: ToastGravity.BOTTOM,
        toastDuration: Duration(seconds: 2));
  }
}

abstract class BaseFormCubit<State> extends BaseCubit<State> {
  late final FormGroup formGroup;

  FormGroup getFormGroup();

  void updateFormValidationState(ControlStatus event);

  void updateFormGroupState(FormGroup formGroup) {}

  void afterInitialize(FormGroup formGroup) {}

  BaseFormCubit({required super.context, required super.initialState}) {
    formGroup = getFormGroup();
    formGroup.statusChanged.listen((ControlStatus event) {
      updateFormValidationState(event);
      updateFormGroupState(formGroup);
    });
    afterInitialize(formGroup);
  }
}

