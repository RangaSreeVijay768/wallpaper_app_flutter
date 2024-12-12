part of 'ads_native_ad_cubit.dart';

@freezed
class AdsNativeAdState with _$AdsNativeAdState {
  const factory AdsNativeAdState.initial({
    String? adUnitId,
    @Default(false) bool showAd,
    required TemplateType templateType,
    required BooleanStatus loadingStatus,
    NativeAd? nativeAd,
  }) = _Initial;
}
