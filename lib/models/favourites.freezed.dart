// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'favourites.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FavouriteHymns _$FavouriteHymnsFromJson(Map<String, dynamic> json) {
  return _FavouriteHymns.fromJson(json);
}

/// @nodoc
mixin _$FavouriteHymns {
  int? get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get hymn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavouriteHymnsCopyWith<FavouriteHymns> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavouriteHymnsCopyWith<$Res> {
  factory $FavouriteHymnsCopyWith(
          FavouriteHymns value, $Res Function(FavouriteHymns) then) =
      _$FavouriteHymnsCopyWithImpl<$Res, FavouriteHymns>;
  @useResult
  $Res call({int? id, String title, String hymn});
}

/// @nodoc
class _$FavouriteHymnsCopyWithImpl<$Res, $Val extends FavouriteHymns>
    implements $FavouriteHymnsCopyWith<$Res> {
  _$FavouriteHymnsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? hymn = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      hymn: null == hymn
          ? _value.hymn
          : hymn // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FavouriteHymnsCopyWith<$Res>
    implements $FavouriteHymnsCopyWith<$Res> {
  factory _$$_FavouriteHymnsCopyWith(
          _$_FavouriteHymns value, $Res Function(_$_FavouriteHymns) then) =
      __$$_FavouriteHymnsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String title, String hymn});
}

/// @nodoc
class __$$_FavouriteHymnsCopyWithImpl<$Res>
    extends _$FavouriteHymnsCopyWithImpl<$Res, _$_FavouriteHymns>
    implements _$$_FavouriteHymnsCopyWith<$Res> {
  __$$_FavouriteHymnsCopyWithImpl(
      _$_FavouriteHymns _value, $Res Function(_$_FavouriteHymns) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? hymn = null,
  }) {
    return _then(_$_FavouriteHymns(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      hymn: null == hymn
          ? _value.hymn
          : hymn // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FavouriteHymns implements _FavouriteHymns {
  const _$_FavouriteHymns({this.id, required this.title, required this.hymn});

  factory _$_FavouriteHymns.fromJson(Map<String, dynamic> json) =>
      _$$_FavouriteHymnsFromJson(json);

  @override
  final int? id;
  @override
  final String title;
  @override
  final String hymn;

  @override
  String toString() {
    return 'FavouriteHymns(id: $id, title: $title, hymn: $hymn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FavouriteHymns &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.hymn, hymn) || other.hymn == hymn));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, hymn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FavouriteHymnsCopyWith<_$_FavouriteHymns> get copyWith =>
      __$$_FavouriteHymnsCopyWithImpl<_$_FavouriteHymns>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FavouriteHymnsToJson(
      this,
    );
  }
}

abstract class _FavouriteHymns implements FavouriteHymns {
  const factory _FavouriteHymns(
      {final int? id,
      required final String title,
      required final String hymn}) = _$_FavouriteHymns;

  factory _FavouriteHymns.fromJson(Map<String, dynamic> json) =
      _$_FavouriteHymns.fromJson;

  @override
  int? get id;
  @override
  String get title;
  @override
  String get hymn;
  @override
  @JsonKey(ignore: true)
  _$$_FavouriteHymnsCopyWith<_$_FavouriteHymns> get copyWith =>
      throw _privateConstructorUsedError;
}
