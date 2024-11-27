import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/base_controller.dart';
import '../popup_data.dart';
import '../../widgets/base_stateless_widget.dart';

abstract class BaseAlertPopupContent<L extends BaseController, C extends BlocBase, S,
P> extends BaseStatelessWidget<L, C, S> {

  closePopup(BuildContext context, PopupData<P> popupData) {
    Navigator.pop(context, popupData);
  }

  const BaseAlertPopupContent({super.key, super.controller, super.onStateChanged});
}
