import 'package:basic/app/core/database/boolean_status.dart';
import 'package:basic/app/core/logger/log.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '/app/core/widgets/base_stateless_widget.dart';
import 'ads_native_ad_controller.dart';
import 'ads_native_ad_cubit.dart';

class AdsNativeAd
    extends BaseStatelessWidget<AdsNativeAdController, AdsNativeAdCubit, AdsNativeAdState> {
  TemplateType templateType;

  AdsNativeAd({required this.templateType, Key? key, super.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AdsNativeAdCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<AdsNativeAdCubit, AdsNativeAdState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          initializeController(context);
          const double adAspectRatioMedium = (325 / 355);

          return (state.loadingStatus== BooleanStatus.success && state.showAd)
              ? SizedBox(
              height: MediaQuery.of(context).size.width *
                  adAspectRatioMedium,
              width: MediaQuery.of(context).size.width,
              child: AdWidget(ad: state.nativeAd!))
              : const SizedBox();
        },
      ),
    );
  }

  @override
  AdsNativeAdCubit createCubitAndAssignToController(BuildContext context) {
    AdsNativeAdCubit cubit =
        AdsNativeAdCubit(context: context, templateType: templateType);
    controller?.cubit = cubit;
    return cubit;
  }
}
