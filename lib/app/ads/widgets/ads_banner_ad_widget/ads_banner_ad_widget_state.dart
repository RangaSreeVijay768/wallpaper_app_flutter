part of 'ads_banner_ad_widget_cubit.dart';

@freezed
class AdsBannerAdWidgetState with _$AdsBannerAdWidgetState {
  const factory AdsBannerAdWidgetState.initial({
     String? adUnitId,
    required AdSize size,
    BannerAd? bannerAd,
    required BooleanStatus loadingStatus,
  }) = _Initial;
}
