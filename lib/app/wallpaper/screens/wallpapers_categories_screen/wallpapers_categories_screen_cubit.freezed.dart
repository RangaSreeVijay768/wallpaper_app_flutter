// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallpapers_categories_screen_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WallpapersCategoriesScreenState {
  List<Categories>? get categoriesData => throw _privateConstructorUsedError;
  BooleanStatus? get getAllCategoriesStatus =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Categories>? categoriesData,
            BooleanStatus? getAllCategoriesStatus)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Categories>? categoriesData,
            BooleanStatus? getAllCategoriesStatus)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Categories>? categoriesData,
            BooleanStatus? getAllCategoriesStatus)?
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

  /// Create a copy of WallpapersCategoriesScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WallpapersCategoriesScreenStateCopyWith<WallpapersCategoriesScreenState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WallpapersCategoriesScreenStateCopyWith<$Res> {
  factory $WallpapersCategoriesScreenStateCopyWith(
          WallpapersCategoriesScreenState value,
          $Res Function(WallpapersCategoriesScreenState) then) =
      _$WallpapersCategoriesScreenStateCopyWithImpl<$Res,
          WallpapersCategoriesScreenState>;
  @useResult
  $Res call(
      {List<Categories>? categoriesData,
      BooleanStatus? getAllCategoriesStatus});
}

/// @nodoc
class _$WallpapersCategoriesScreenStateCopyWithImpl<$Res,
        $Val extends WallpapersCategoriesScreenState>
    implements $WallpapersCategoriesScreenStateCopyWith<$Res> {
  _$WallpapersCategoriesScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WallpapersCategoriesScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoriesData = freezed,
    Object? getAllCategoriesStatus = freezed,
  }) {
    return _then(_value.copyWith(
      categoriesData: freezed == categoriesData
          ? _value.categoriesData
          : categoriesData // ignore: cast_nullable_to_non_nullable
              as List<Categories>?,
      getAllCategoriesStatus: freezed == getAllCategoriesStatus
          ? _value.getAllCategoriesStatus
          : getAllCategoriesStatus // ignore: cast_nullable_to_non_nullable
              as BooleanStatus?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $WallpapersCategoriesScreenStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Categories>? categoriesData,
      BooleanStatus? getAllCategoriesStatus});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$WallpapersCategoriesScreenStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of WallpapersCategoriesScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoriesData = freezed,
    Object? getAllCategoriesStatus = freezed,
  }) {
    return _then(_$InitialImpl(
      categoriesData: freezed == categoriesData
          ? _value._categoriesData
          : categoriesData // ignore: cast_nullable_to_non_nullable
              as List<Categories>?,
      getAllCategoriesStatus: freezed == getAllCategoriesStatus
          ? _value.getAllCategoriesStatus
          : getAllCategoriesStatus // ignore: cast_nullable_to_non_nullable
              as BooleanStatus?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {final List<Categories>? categoriesData, this.getAllCategoriesStatus})
      : _categoriesData = categoriesData;

  final List<Categories>? _categoriesData;
  @override
  List<Categories>? get categoriesData {
    final value = _categoriesData;
    if (value == null) return null;
    if (_categoriesData is EqualUnmodifiableListView) return _categoriesData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final BooleanStatus? getAllCategoriesStatus;

  @override
  String toString() {
    return 'WallpapersCategoriesScreenState.initial(categoriesData: $categoriesData, getAllCategoriesStatus: $getAllCategoriesStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality()
                .equals(other._categoriesData, _categoriesData) &&
            (identical(other.getAllCategoriesStatus, getAllCategoriesStatus) ||
                other.getAllCategoriesStatus == getAllCategoriesStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_categoriesData),
      getAllCategoriesStatus);

  /// Create a copy of WallpapersCategoriesScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Categories>? categoriesData,
            BooleanStatus? getAllCategoriesStatus)
        initial,
  }) {
    return initial(categoriesData, getAllCategoriesStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Categories>? categoriesData,
            BooleanStatus? getAllCategoriesStatus)?
        initial,
  }) {
    return initial?.call(categoriesData, getAllCategoriesStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Categories>? categoriesData,
            BooleanStatus? getAllCategoriesStatus)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(categoriesData, getAllCategoriesStatus);
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

abstract class _Initial implements WallpapersCategoriesScreenState {
  const factory _Initial(
      {final List<Categories>? categoriesData,
      final BooleanStatus? getAllCategoriesStatus}) = _$InitialImpl;

  @override
  List<Categories>? get categoriesData;
  @override
  BooleanStatus? get getAllCategoriesStatus;

  /// Create a copy of WallpapersCategoriesScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
