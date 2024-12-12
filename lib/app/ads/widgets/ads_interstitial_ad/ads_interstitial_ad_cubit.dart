import 'dart:io';

import 'package:basic/app/core/ads_pub/dev_ads.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../core/database/boolean_status.dart';
import '/app/core/blocs/base_cubit.dart';

part 'ads_interstitial_ad_cubit.freezed.dart';
part 'ads_interstitial_ad_state.dart';

class AdsInterstitialAdCubit extends BaseCubit<AdsInterstitialAdState> {
  AdsInterstitialAdCubit({required super.context})
      : super(
            initialState: AdsInterstitialAdState.initial(
                adUnitId: Platform.isAndroid
                    ? DevAds.interstitialAndroidAdId
                    : DevAds.interstitialIosAdId,
                loadingStatus: BooleanStatus.initial)) {
    loadInterstitialAd();
  }

  void setFullScreenContentCallbackIn() {
    state.interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) {},
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        print("$ad onAdDismissedFullScreenContent");

        //dispose the dismissed ad
        ad.dispose();
        //Load for next showing
        loadInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        print("$ad  onAdFailedToShowFullScreenContent: $error ");
        //dispose the failed ad
        ad.dispose();
        //Load for next showing
        loadInterstitialAd();
      },
      onAdImpression: (InterstitialAd ad) => print("$ad Impression occured"),
    );
  }

  void loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: state.adUnitId!,
      request: const AdRequest(),
      adLoadCallback:
          InterstitialAdLoadCallback(onAdLoaded: (InterstitialAd ad) {
        //keep a reference to the ad as you can show it later
        emit(state.copyWith(
            loadingStatus: BooleanStatus.success, interstitialAd: ad));
        //set on full screen content call back
        setFullScreenContentCallbackIn();
      }, onAdFailedToLoad: (LoadAdError loadAdError) {
        emit(state.copyWith(loadingStatus: BooleanStatus.error));
        //ad failed to load
        print("Interstitial ad failed to load: $loadAdError");
      }),
    );
    // emit(state.copyWith(interstitialAd: interstitialAd));
  }

  void showInterstitialAd() {
    if (state.interstitialAd == null) {
      print("Ad not ready!");
      return;
    } else {
      state.interstitialAd!.show();
    }
  }
}
