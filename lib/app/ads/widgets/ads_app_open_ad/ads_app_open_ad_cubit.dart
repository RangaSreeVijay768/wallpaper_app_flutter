import 'dart:io';

import 'package:basic/app/core/ads_pub/dev_ads.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../core/database/boolean_status.dart';
import '../../../core/logger/log.dart';
import '/app/core/blocs/base_cubit.dart';

part 'ads_app_open_ad_cubit.freezed.dart';
part 'ads_app_open_ad_state.dart';

class AdsAppOpenAdCubit extends BaseCubit<AdsAppOpenAdState> {
  /// Maximum duration allowed between loading and showing the ad.
  final Duration maxCacheDuration = const Duration(hours: 4);

  AdsAppOpenAdCubit({required super.context})
      : super(
            initialState: AdsAppOpenAdState.initial(
                adUnitId: Platform.isAndroid
                    ? DevAds.appOpenAndroidAdId
                    : DevAds.appOpenIosAdId,
                openStatus: BooleanStatus.closed,
                isOpenFirstTime: true)) {
    this.listenToAppStateChanges();
  }

  Future<void> showAdIfAvailable() async {
    if (state.appOpenAd == null) {
      logger.d('Tried to show ad before available.');
      loadAd();
      return;
    }
    if (state.openStatus == BooleanStatus.active) {
      logger.d('Tried to show ad while already showing an ad.');
      return;
    }
    if (state.adLoadTime != null &&
        DateTime.now().subtract(maxCacheDuration).isAfter(state.adLoadTime!)) {
      logger.d('Maximum cache duration exceeded. Loading another ad.');
      state.appOpenAd!.dispose();
      emit(state.copyWith(openStatus: BooleanStatus.closed, appOpenAd: null));
      loadAd();
      return;
    }
    // Set the fullScreenContentCallback and show the ad.
    state.appOpenAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) {
        emit(state.copyWith(openStatus: BooleanStatus.active));
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        state.appOpenAd!.dispose();
        emit(state.copyWith(openStatus: BooleanStatus.closed, appOpenAd: null));
      },
      onAdDismissedFullScreenContent: (ad) {
        print('$ad onAdDismissedFullScreenContent');
        state.appOpenAd!.dispose();
        emit(state.copyWith(openStatus: BooleanStatus.closed, appOpenAd: null));
        loadAd();
      },
    );
    return state.appOpenAd!.show();
  }

  void loadAd() {
    AppOpenAd.load(
      adUnitId: state.adUnitId,
      // orientation: AppOpenAd.orientationPortrait,
      request: AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          DateTime adLoadTime = DateTime.now();
          emit(state.copyWith(appOpenAd: ad, adLoadTime: adLoadTime));
        },
        onAdFailedToLoad: (error) {
          print('AppOpenAd failed to load: $error');
          // Handle the error.
        },
      ),
    );
  }

  listenToAppStateChanges() {
    AppStateEventNotifier.startListening();
    AppStateEventNotifier.appStateStream.forEach((appOpenState) {
          if (appOpenState == AppState.foreground)
            {
              if (this.state.isOpenFirstTime)
                {this.emit(state.copyWith(isOpenFirstTime: false));}
              else
                {showAdIfAvailable();}
            }
        });
  }
}
