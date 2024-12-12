import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'ads_interstitial_ad_controller.dart';
import 'ads_interstitial_ad_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class AdsInterstitialAd
    extends BaseStatelessWidget<
        AdsInterstitialAdController,
        AdsInterstitialAdCubit, AdsInterstitialAdState> {

  AdsInterstitialAd({Key? key, super.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AdsInterstitialAdCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<AdsInterstitialAdCubit, AdsInterstitialAdState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          initializeController(context);
          return ElevatedButton(
              onPressed: () {
                getCubit(context).showInterstitialAd();
              },
              child: Text("Show Interstitial ad"));
        },
      ),
    );
  }

  @override
  AdsInterstitialAdCubit createCubitAndAssignToController(
      BuildContext context) {
    AdsInterstitialAdCubit cubit = AdsInterstitialAdCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }

}
