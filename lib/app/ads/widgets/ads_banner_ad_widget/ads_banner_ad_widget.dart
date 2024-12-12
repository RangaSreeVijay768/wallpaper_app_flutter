import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '/app/core/widgets/base_stateless_widget.dart';
import 'ads_banner_ad_widget_controller.dart';
import 'ads_banner_ad_widget_cubit.dart';

class AdsBannerAdWidget extends BaseStatelessWidget<AdsBannerAdWidgetController,
    AdsBannerAdWidgetCubit, AdsBannerAdWidgetState> {
  int? height;
  int? width;
  AdsBannerAdWidget({super.key, super.controller, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AdsBannerAdWidgetCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<AdsBannerAdWidgetCubit, AdsBannerAdWidgetState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return state.bannerAd != null
              ? Container(
            alignment: Alignment.center,
            child: AdWidget(ad: state.bannerAd!),
          )
              : Container(height: 150);
        },
      ),
    );
  }

  @override
  AdsBannerAdWidgetCubit createCubitAndAssignToController(
      BuildContext context) {
    AdsBannerAdWidgetCubit cubit = AdsBannerAdWidgetCubit(width: width, height: height);
    controller?.cubit = cubit;
    return cubit;
  }
}
