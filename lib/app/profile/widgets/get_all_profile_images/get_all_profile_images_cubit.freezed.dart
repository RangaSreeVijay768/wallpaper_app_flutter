// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_all_profile_images_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetAllProfileImagesState {
  GetAllProfileImagesResponse? get getAllProfileImagesResponse =>
      throw _privateConstructorUsedError;
  BooleanStatus get getAllProfileImagesStatus =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            GetAllProfileImagesResponse? getAllProfileImagesResponse,
            BooleanStatus getAllProfileImagesStatus)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(GetAllProfileImagesResponse? getAllProfileImagesResponse,
            BooleanStatus getAllProfileImagesStatus)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GetAllProfileImagesResponse? getAllProfileImagesResponse,
            BooleanStatus getAllProfileImagesStatus)?
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

  /// Create a copy of GetAllProfileImagesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetAllProfileImagesStateCopyWith<GetAllProfileImagesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetAllProfileImagesStateCopyWith<$Res> {
  factory $GetAllProfileImagesStateCopyWith(GetAllProfileImagesState value,
          $Res Function(GetAllProfileImagesState) then) =
      _$GetAllProfileImagesStateCopyWithImpl<$Res, GetAllProfileImagesState>;
  @useResult
  $Res call(
      {GetAllProfileImagesResponse? getAllProfileImagesResponse,
      BooleanStatus getAllProfileImagesStatus});
}

/// @nodoc
class _$GetAllProfileImagesStateCopyWithImpl<$Res,
        $Val extends GetAllProfileImagesState>
    implements $GetAllProfileImagesStateCopyWith<$Res> {
  _$GetAllProfileImagesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetAllProfileImagesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getAllProfileImagesResponse = freezed,
    Object? getAllProfileImagesStatus = null,
  }) {
    return _then(_value.copyWith(
      getAllProfileImagesResponse: freezed == getAllProfileImagesResponse
          ? _value.getAllProfileImagesResponse
          : getAllProfileImagesResponse // ignore: cast_nullable_to_non_nullable
              as GetAllProfileImagesResponse?,
      getAllProfileImagesStatus: null == getAllProfileImagesStatus
          ? _value.getAllProfileImagesStatus
          : getAllProfileImagesStatus // ignore: cast_nullable_to_non_nullable
              as BooleanStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $GetAllProfileImagesStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GetAllProfileImagesResponse? getAllProfileImagesResponse,
      BooleanStatus getAllProfileImagesStatus});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$GetAllProfileImagesStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetAllProfileImagesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getAllProfileImagesResponse = freezed,
    Object? getAllProfileImagesStatus = null,
  }) {
    return _then(_$InitialImpl(
      getAllProfileImagesResponse: freezed == getAllProfileImagesResponse
          ? _value.getAllProfileImagesResponse
          : getAllProfileImagesResponse // ignore: cast_nullable_to_non_nullable
              as GetAllProfileImagesResponse?,
      getAllProfileImagesStatus: null == getAllProfileImagesStatus
          ? _value.getAllProfileImagesStatus
          : getAllProfileImagesStatus // ignore: cast_nullable_to_non_nullable
              as BooleanStatus,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.getAllProfileImagesResponse,
      this.getAllProfileImagesStatus = BooleanStatus.initial});

  @override
  final GetAllProfileImagesResponse? getAllProfileImagesResponse;
  @override
  @JsonKey()
  final BooleanStatus getAllProfileImagesStatus;

  @override
  String toString() {
    return 'GetAllProfileImagesState.initial(getAllProfileImagesResponse: $getAllProfileImagesResponse, getAllProfileImagesStatus: $getAllProfileImagesStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.getAllProfileImagesResponse,
                    getAllProfileImagesResponse) ||
                other.getAllProfileImagesResponse ==
                    getAllProfileImagesResponse) &&
            (identical(other.getAllProfileImagesStatus,
                    getAllProfileImagesStatus) ||
                other.getAllProfileImagesStatus == getAllProfileImagesStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, getAllProfileImagesResponse, getAllProfileImagesStatus);

  /// Create a copy of GetAllProfileImagesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            GetAllProfileImagesResponse? getAllProfileImagesResponse,
            BooleanStatus getAllProfileImagesStatus)
        initial,
  }) {
    return initial(getAllProfileImagesResponse, getAllProfileImagesStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(GetAllProfileImagesResponse? getAllProfileImagesResponse,
            BooleanStatus getAllProfileImagesStatus)?
        initial,
  }) {
    return initial?.call(
        getAllProfileImagesResponse, getAllProfileImagesStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GetAllProfileImagesResponse? getAllProfileImagesResponse,
            BooleanStatus getAllProfileImagesStatus)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(getAllProfileImagesResponse, getAllProfileImagesStatus);
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

abstract class _Initial implements GetAllProfileImagesState {
  const factory _Initial(
      {final GetAllProfileImagesResponse? getAllProfileImagesResponse,
      final BooleanStatus getAllProfileImagesStatus}) = _$InitialImpl;

  @override
  GetAllProfileImagesResponse? get getAllProfileImagesResponse;
  @override
  BooleanStatus get getAllProfileImagesStatus;

  /// Create a copy of GetAllProfileImagesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
