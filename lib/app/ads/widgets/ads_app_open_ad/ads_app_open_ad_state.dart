part of 'ads_app_open_ad_cubit.dart';

@freezed
class AdsAppOpenAdState with _$AdsAppOpenAdState {
  const factory AdsAppOpenAdState.initial({
    required String adUnitId,
    AppOpenAd? appOpenAd,
    DateTime? adLoadTime,
    required BooleanStatus openStatus,
    required bool isOpenFirstTime
  }) = _Initial;
}
