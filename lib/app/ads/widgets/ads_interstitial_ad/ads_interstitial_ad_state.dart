part of 'ads_interstitial_ad_cubit.dart';

@freezed
class AdsInterstitialAdState with _$AdsInterstitialAdState {
  const factory AdsInterstitialAdState.initial({
    String? adUnitId,
    InterstitialAd? interstitialAd,
    required BooleanStatus loadingStatus,
}) = _Initial;
}
