// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallpapers_favourite_screen_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WallpapersFavouriteScreenState {
  List<String>? get favourites => throw _privateConstructorUsedError;
  List<String>? get favoriteProfiles => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<String>? favourites, List<String>? favoriteProfiles)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<String>? favourites, List<String>? favoriteProfiles)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String>? favourites, List<String>? favoriteProfiles)?
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

  /// Create a copy of WallpapersFavouriteScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WallpapersFavouriteScreenStateCopyWith<WallpapersFavouriteScreenState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WallpapersFavouriteScreenStateCopyWith<$Res> {
  factory $WallpapersFavouriteScreenStateCopyWith(
          WallpapersFavouriteScreenState value,
          $Res Function(WallpapersFavouriteScreenState) then) =
      _$WallpapersFavouriteScreenStateCopyWithImpl<$Res,
          WallpapersFavouriteScreenState>;
  @useResult
  $Res call({List<String>? favourites, List<String>? favoriteProfiles});
}

/// @nodoc
class _$WallpapersFavouriteScreenStateCopyWithImpl<$Res,
        $Val extends WallpapersFavouriteScreenState>
    implements $WallpapersFavouriteScreenStateCopyWith<$Res> {
  _$WallpapersFavouriteScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WallpapersFavouriteScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favourites = freezed,
    Object? favoriteProfiles = freezed,
  }) {
    return _then(_value.copyWith(
      favourites: freezed == favourites
          ? _value.favourites
          : favourites // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      favoriteProfiles: freezed == favoriteProfiles
          ? _value.favoriteProfiles
          : favoriteProfiles // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $WallpapersFavouriteScreenStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String>? favourites, List<String>? favoriteProfiles});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$WallpapersFavouriteScreenStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of WallpapersFavouriteScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favourites = freezed,
    Object? favoriteProfiles = freezed,
  }) {
    return _then(_$InitialImpl(
      favourites: freezed == favourites
          ? _value._favourites
          : favourites // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      favoriteProfiles: freezed == favoriteProfiles
          ? _value._favoriteProfiles
          : favoriteProfiles // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {final List<String>? favourites, final List<String>? favoriteProfiles})
      : _favourites = favourites,
        _favoriteProfiles = favoriteProfiles;

  final List<String>? _favourites;
  @override
  List<String>? get favourites {
    final value = _favourites;
    if (value == null) return null;
    if (_favourites is EqualUnmodifiableListView) return _favourites;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _favoriteProfiles;
  @override
  List<String>? get favoriteProfiles {
    final value = _favoriteProfiles;
    if (value == null) return null;
    if (_favoriteProfiles is EqualUnmodifiableListView)
      return _favoriteProfiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'WallpapersFavouriteScreenState.initial(favourites: $favourites, favoriteProfiles: $favoriteProfiles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality()
                .equals(other._favourites, _favourites) &&
            const DeepCollectionEquality()
                .equals(other._favoriteProfiles, _favoriteProfiles));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_favourites),
      const DeepCollectionEquality().hash(_favoriteProfiles));

  /// Create a copy of WallpapersFavouriteScreenState
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
            List<String>? favourites, List<String>? favoriteProfiles)
        initial,
  }) {
    return initial(favourites, favoriteProfiles);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<String>? favourites, List<String>? favoriteProfiles)?
        initial,
  }) {
    return initial?.call(favourites, favoriteProfiles);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String>? favourites, List<String>? favoriteProfiles)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(favourites, favoriteProfiles);
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

abstract class _Initial implements WallpapersFavouriteScreenState {
  const factory _Initial(
      {final List<String>? favourites,
      final List<String>? favoriteProfiles}) = _$InitialImpl;

  @override
  List<String>? get favourites;
  @override
  List<String>? get favoriteProfiles;

  /// Create a copy of WallpapersFavouriteScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
