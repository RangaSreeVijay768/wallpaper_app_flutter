import 'dart:io' show Platform;

import 'package:basic/app/core/ads_pub/dev_ads.dart';
import 'package:basic/app/core/database/boolean_status.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../core/blocs/base_cubit.dart';
import '../../../core/logger/log.dart';

part 'ads_native_ad_cubit.freezed.dart';
part 'ads_native_ad_state.dart';

class AdsNativeAdCubit extends BaseCubit<AdsNativeAdState> {
  AdsNativeAdCubit({required super.context, required TemplateType templateType})
      : super(
            initialState: AdsNativeAdState.initial(
                templateType: templateType,
                loadingStatus: BooleanStatus.initial)) {
    initializeAdConfigAndLoadAd();
    // loadNativeAd();
  }

  initializeAdConfigAndLoadAd() async {
    String adUnitId = Platform.isAndroid
        ? DevAds.nativeAndroidAdId
        : DevAds.nativeIosAdId;
    emit(state.copyWith(adUnitId: adUnitId));
    await loadNativeAd();
  }

  setAdShow(bool show) {
    emit(state.copyWith(showAd: show));
  }

  loadNativeAd() {
    NativeAd nativeAd = NativeAd(
        adUnitId: state.adUnitId!,
        listener: NativeAdListener(
          onAdLoaded: (ad) {
            logger.d(ad);
            setAdShow(true);
            emit(state.copyWith(loadingStatus: BooleanStatus.success));
          },
          onAdFailedToLoad: (ad, error) {
            // Dispose the ad here to free resources.
            logger.d('$NativeAd failed to load: $error');
            ad.dispose();
          },
        ),
        request: const AdRequest(),
        // Styling
        nativeTemplateStyle: NativeTemplateStyle(
            // Required: Choose a template.
            templateType: state.templateType,
            // Optional: Customize the ad's style.
            mainBackgroundColor: Colors.purple,
            cornerRadius: 50.0,
            callToActionTextStyle: NativeTemplateTextStyle(
                textColor: Colors.cyan,
                backgroundColor: Colors.red,
                style: NativeTemplateFontStyle.monospace,
                size: 16.0),
            primaryTextStyle: NativeTemplateTextStyle(
                textColor: Colors.red,
                backgroundColor: Colors.cyan,
                style: NativeTemplateFontStyle.italic,
                size: 16.0),
            secondaryTextStyle: NativeTemplateTextStyle(
                textColor: Colors.green,
                backgroundColor: Colors.black,
                style: NativeTemplateFontStyle.bold,
                size: 16.0),
            tertiaryTextStyle: NativeTemplateTextStyle(
                textColor: Colors.brown,
                backgroundColor: Colors.amber,
                style: NativeTemplateFontStyle.normal,
                size: 16.0)))
      ..load();
    emit(state.copyWith(
        nativeAd: nativeAd, loadingStatus: BooleanStatus.pending));
  }
}
