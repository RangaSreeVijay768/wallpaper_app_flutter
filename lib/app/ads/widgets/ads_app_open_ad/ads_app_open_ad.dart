import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/app/core/widgets/base_stateless_widget.dart';
import 'ads_app_open_ad_controller.dart';
import 'ads_app_open_ad_cubit.dart';

class AdsAppOpenAd
    extends BaseStatelessWidget<AdsAppOpenAdController, AdsAppOpenAdCubit, AdsAppOpenAdState> {
  AdsAppOpenAd({Key? key, super.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AdsAppOpenAdCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<AdsAppOpenAdCubit, AdsAppOpenAdState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          initializeController(context);
          return ElevatedButton(
              onPressed: () {
                getCubit(context).showAdIfAvailable();
              },
              child: Text("Show app open ad"));
        },
      ),
    );
  }

  @override
  AdsAppOpenAdCubit createCubitAndAssignToController(BuildContext context) {
    AdsAppOpenAdCubit cubit = AdsAppOpenAdCubit(context: context);
    controller?.cubit = cubit;
    return cubit;
  }
}
