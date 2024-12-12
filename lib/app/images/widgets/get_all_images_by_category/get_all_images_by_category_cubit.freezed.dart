// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_all_images_by_category_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetAllImagesByCategoryState {
  String get slug => throw _privateConstructorUsedError;
  GetAllImagesByCategoryResponse? get getAllImagesByCategoryResponse =>
      throw _privateConstructorUsedError;
  BooleanStatus get getAllImagesByCategoryStatus =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String slug,
            GetAllImagesByCategoryResponse? getAllImagesByCategoryResponse,
            BooleanStatus getAllImagesByCategoryStatus)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String slug,
            GetAllImagesByCategoryResponse? getAllImagesByCategoryResponse,
            BooleanStatus getAllImagesByCategoryStatus)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String slug,
            GetAllImagesByCategoryResponse? getAllImagesByCategoryResponse,
            BooleanStatus getAllImagesByCategoryStatus)?
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

  /// Create a copy of GetAllImagesByCategoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetAllImagesByCategoryStateCopyWith<GetAllImagesByCategoryState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetAllImagesByCategoryStateCopyWith<$Res> {
  factory $GetAllImagesByCategoryStateCopyWith(
          GetAllImagesByCategoryState value,
          $Res Function(GetAllImagesByCategoryState) then) =
      _$GetAllImagesByCategoryStateCopyWithImpl<$Res,
          GetAllImagesByCategoryState>;
  @useResult
  $Res call(
      {String slug,
      GetAllImagesByCategoryResponse? getAllImagesByCategoryResponse,
      BooleanStatus getAllImagesByCategoryStatus});
}

/// @nodoc
class _$GetAllImagesByCategoryStateCopyWithImpl<$Res,
        $Val extends GetAllImagesByCategoryState>
    implements $GetAllImagesByCategoryStateCopyWith<$Res> {
  _$GetAllImagesByCategoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetAllImagesByCategoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slug = null,
    Object? getAllImagesByCategoryResponse = freezed,
    Object? getAllImagesByCategoryStatus = null,
  }) {
    return _then(_value.copyWith(
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      getAllImagesByCategoryResponse: freezed == getAllImagesByCategoryResponse
          ? _value.getAllImagesByCategoryResponse
          : getAllImagesByCategoryResponse // ignore: cast_nullable_to_non_nullable
              as GetAllImagesByCategoryResponse?,
      getAllImagesByCategoryStatus: null == getAllImagesByCategoryStatus
          ? _value.getAllImagesByCategoryStatus
          : getAllImagesByCategoryStatus // ignore: cast_nullable_to_non_nullable
              as BooleanStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $GetAllImagesByCategoryStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String slug,
      GetAllImagesByCategoryResponse? getAllImagesByCategoryResponse,
      BooleanStatus getAllImagesByCategoryStatus});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$GetAllImagesByCategoryStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetAllImagesByCategoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slug = null,
    Object? getAllImagesByCategoryResponse = freezed,
    Object? getAllImagesByCategoryStatus = null,
  }) {
    return _then(_$InitialImpl(
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      getAllImagesByCategoryResponse: freezed == getAllImagesByCategoryResponse
          ? _value.getAllImagesByCategoryResponse
          : getAllImagesByCategoryResponse // ignore: cast_nullable_to_non_nullable
              as GetAllImagesByCategoryResponse?,
      getAllImagesByCategoryStatus: null == getAllImagesByCategoryStatus
          ? _value.getAllImagesByCategoryStatus
          : getAllImagesByCategoryStatus // ignore: cast_nullable_to_non_nullable
              as BooleanStatus,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required this.slug,
      this.getAllImagesByCategoryResponse,
      this.getAllImagesByCategoryStatus = BooleanStatus.initial});

  @override
  final String slug;
  @override
  final GetAllImagesByCategoryResponse? getAllImagesByCategoryResponse;
  @override
  @JsonKey()
  final BooleanStatus getAllImagesByCategoryStatus;

  @override
  String toString() {
    return 'GetAllImagesByCategoryState.initial(slug: $slug, getAllImagesByCategoryResponse: $getAllImagesByCategoryResponse, getAllImagesByCategoryStatus: $getAllImagesByCategoryStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.getAllImagesByCategoryResponse,
                    getAllImagesByCategoryResponse) ||
                other.getAllImagesByCategoryResponse ==
                    getAllImagesByCategoryResponse) &&
            (identical(other.getAllImagesByCategoryStatus,
                    getAllImagesByCategoryStatus) ||
                other.getAllImagesByCategoryStatus ==
                    getAllImagesByCategoryStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, slug,
      getAllImagesByCategoryResponse, getAllImagesByCategoryStatus);

  /// Create a copy of GetAllImagesByCategoryState
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
            String slug,
            GetAllImagesByCategoryResponse? getAllImagesByCategoryResponse,
            BooleanStatus getAllImagesByCategoryStatus)
        initial,
  }) {
    return initial(
        slug, getAllImagesByCategoryResponse, getAllImagesByCategoryStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String slug,
            GetAllImagesByCategoryResponse? getAllImagesByCategoryResponse,
            BooleanStatus getAllImagesByCategoryStatus)?
        initial,
  }) {
    return initial?.call(
        slug, getAllImagesByCategoryResponse, getAllImagesByCategoryStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String slug,
            GetAllImagesByCategoryResponse? getAllImagesByCategoryResponse,
            BooleanStatus getAllImagesByCategoryStatus)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(
          slug, getAllImagesByCategoryResponse, getAllImagesByCategoryStatus);
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

abstract class _Initial implements GetAllImagesByCategoryState {
  const factory _Initial(
      {required final String slug,
      final GetAllImagesByCategoryResponse? getAllImagesByCategoryResponse,
      final BooleanStatus getAllImagesByCategoryStatus}) = _$InitialImpl;

  @override
  String get slug;
  @override
  GetAllImagesByCategoryResponse? get getAllImagesByCategoryResponse;
  @override
  BooleanStatus get getAllImagesByCategoryStatus;

  /// Create a copy of GetAllImagesByCategoryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
