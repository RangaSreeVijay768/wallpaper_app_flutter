import 'dart:io' show Platform;

import 'package:basic/app/core/ads_pub/dev_ads.dart';
import 'package:basic/app/core/database/boolean_status.dart';
import 'package:basic/app/core/logger/log.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

part 'ads_banner_ad_widget_cubit.freezed.dart';
part 'ads_banner_ad_widget_state.dart';

class AdsBannerAdWidgetCubit extends Cubit<AdsBannerAdWidgetState> {
  AdsBannerAdWidgetCubit({int? height, int? width})
      : super(AdsBannerAdWidgetState.initial(
            size: AdSize(width: width ?? 350, height: height ?? 58), loadingStatus: BooleanStatus.initial)) {
    initializeAdConfigAndLoad();
  }

  initializeAdConfigAndLoad() async {
    String adUnitId = Platform.isAndroid
        ? DevAds.bannerAndroidAdId
        : DevAds.bannerIosAdId;
    logger.d(adUnitId);
    emit(state.copyWith(adUnitId: adUnitId));
    await loadBannerAd();
  }

  loadBannerAd() async {
    BannerAd bannerAd = BannerAd(
        size: state.size,
        adUnitId: state.adUnitId!,
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            logger.d(ad);
            emit(state.copyWith(loadingStatus: BooleanStatus.success));
          },
          onAdFailedToLoad: (ad, err) {
            logger.d(ad);
            emit(state.copyWith(loadingStatus: BooleanStatus.error));
            ad.dispose();
          },
        ),
        request: const AdRequest())
      ..load();
    logger.d(bannerAd);
    emit(state.copyWith(bannerAd: bannerAd));
  }
}
