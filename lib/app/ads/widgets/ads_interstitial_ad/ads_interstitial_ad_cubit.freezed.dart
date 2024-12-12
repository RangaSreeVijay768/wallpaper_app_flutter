// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ads_interstitial_ad_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AdsInterstitialAdState {
  String? get adUnitId => throw _privateConstructorUsedError;
  InterstitialAd? get interstitialAd => throw _privateConstructorUsedError;
  BooleanStatus get loadingStatus => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? adUnitId, InterstitialAd? interstitialAd,
            BooleanStatus loadingStatus)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? adUnitId, InterstitialAd? interstitialAd,
            BooleanStatus loadingStatus)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? adUnitId, InterstitialAd? interstitialAd,
            BooleanStatus loadingStatus)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of AdsInterstitialAdState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdsInterstitialAdStateCopyWith<AdsInterstitialAdState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdsInterstitialAdStateCopyWith<$Res> {
  factory $AdsInterstitialAdStateCopyWith(AdsInterstitialAdState value,
          $Res Function(AdsInterstitialAdState) then) =
      _$AdsInterstitialAdStateCopyWithImpl<$Res, AdsInterstitialAdState>;
  @useResult
  $Res call(
      {String? adUnitId,
      InterstitialAd? interstitialAd,
      BooleanStatus loadingStatus});
}

/// @nodoc
class _$AdsInterstitialAdStateCopyWithImpl<$Res,
        $Val extends AdsInterstitialAdState>
    implements $AdsInterstitialAdStateCopyWith<$Res> {
  _$AdsInterstitialAdStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdsInterstitialAdState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adUnitId = freezed,
    Object? interstitialAd = freezed,
    Object? loadingStatus = null,
  }) {
    return _then(_value.copyWith(
      adUnitId: freezed == adUnitId
          ? _value.adUnitId
          : adUnitId // ignore: cast_nullable_to_non_nullable
              as String?,
      interstitialAd: freezed == interstitialAd
          ? _value.interstitialAd
          : interstitialAd // ignore: cast_nullable_to_non_nullable
              as InterstitialAd?,
      loadingStatus: null == loadingStatus
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as BooleanStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $AdsInterstitialAdStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? adUnitId,
      InterstitialAd? interstitialAd,
      BooleanStatus loadingStatus});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AdsInterstitialAdStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdsInterstitialAdState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adUnitId = freezed,
    Object? interstitialAd = freezed,
    Object? loadingStatus = null,
  }) {
    return _then(_$InitialImpl(
      adUnitId: freezed == adUnitId
          ? _value.adUnitId
          : adUnitId // ignore: cast_nullable_to_non_nullable
              as String?,
      interstitialAd: freezed == interstitialAd
          ? _value.interstitialAd
          : interstitialAd // ignore: cast_nullable_to_non_nullable
              as InterstitialAd?,
      loadingStatus: null == loadingStatus
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as BooleanStatus,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.adUnitId, this.interstitialAd, required this.loadingStatus});

  @override
  final String? adUnitId;
  @override
  final InterstitialAd? interstitialAd;
  @override
  final BooleanStatus loadingStatus;

  @override
  String toString() {
    return 'AdsInterstitialAdState.initial(adUnitId: $adUnitId, interstitialAd: $interstitialAd, loadingStatus: $loadingStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.adUnitId, adUnitId) ||
                other.adUnitId == adUnitId) &&
            (identical(other.interstitialAd, interstitialAd) ||
                other.interstitialAd == interstitialAd) &&
            (identical(other.loadingStatus, loadingStatus) ||
                other.loadingStatus == loadingStatus));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, adUnitId, interstitialAd, loadingStatus);

  /// Create a copy of AdsInterstitialAdState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? adUnitId, InterstitialAd? interstitialAd,
            BooleanStatus loadingStatus)
        initial,
  }) {
    return initial(adUnitId, interstitialAd, loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? adUnitId, InterstitialAd? interstitialAd,
            BooleanStatus loadingStatus)?
        initial,
  }) {
    return initial?.call(adUnitId, interstitialAd, loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? adUnitId, InterstitialAd? interstitialAd,
            BooleanStatus loadingStatus)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(adUnitId, interstitialAd, loadingStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AdsInterstitialAdState {
  const factory _Initial(
      {final String? adUnitId,
      final InterstitialAd? interstitialAd,
      required final BooleanStatus loadingStatus}) = _$InitialImpl;

  @override
  String? get adUnitId;
  @override
  InterstitialAd? get interstitialAd;
  @override
  BooleanStatus get loadingStatus;

  /// Create a copy of AdsInterstitialAdState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
