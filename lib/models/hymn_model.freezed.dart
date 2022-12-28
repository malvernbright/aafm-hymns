// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'hymn_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HymnsModel _$HymnsModelFromJson(Map<String, dynamic> json) {
  return _HymnsModel.fromJson(json);
}

/// @nodoc
mixin _$HymnsModel {
  int? get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get hymn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HymnsModelCopyWith<HymnsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HymnsModelCopyWith<$Res> {
  factory $HymnsModelCopyWith(
          HymnsModel value, $Res Function(HymnsModel) then) =
      _$HymnsModelCopyWithImpl<$Res, HymnsModel>;
  @useResult
  $Res call({int? id, String title, String hymn});
}

/// @nodoc
class _$HymnsModelCopyWithImpl<$Res, $Val extends HymnsModel>
    implements $HymnsModelCopyWith<$Res> {
  _$HymnsModelCopyWithImpl(this._value, this._then);

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
abstract class _$$_HymnsModelCopyWith<$Res>
    implements $HymnsModelCopyWith<$Res> {
  factory _$$_HymnsModelCopyWith(
          _$_HymnsModel value, $Res Function(_$_HymnsModel) then) =
      __$$_HymnsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String title, String hymn});
}

/// @nodoc
class __$$_HymnsModelCopyWithImpl<$Res>
    extends _$HymnsModelCopyWithImpl<$Res, _$_HymnsModel>
    implements _$$_HymnsModelCopyWith<$Res> {
  __$$_HymnsModelCopyWithImpl(
      _$_HymnsModel _value, $Res Function(_$_HymnsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? hymn = null,
  }) {
    return _then(_$_HymnsModel(
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
class _$_HymnsModel implements _HymnsModel {
  const _$_HymnsModel({this.id, required this.title, required this.hymn});

  factory _$_HymnsModel.fromJson(Map<String, dynamic> json) =>
      _$$_HymnsModelFromJson(json);

  @override
  final int? id;
  @override
  final String title;
  @override
  final String hymn;

  @override
  String toString() {
    return 'HymnsModel(id: $id, title: $title, hymn: $hymn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HymnsModel &&
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
  _$$_HymnsModelCopyWith<_$_HymnsModel> get copyWith =>
      __$$_HymnsModelCopyWithImpl<_$_HymnsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HymnsModelToJson(
      this,
    );
  }
}

abstract class _HymnsModel implements HymnsModel {
  const factory _HymnsModel(
      {final int? id,
      required final String title,
      required final String hymn}) = _$_HymnsModel;

  factory _HymnsModel.fromJson(Map<String, dynamic> json) =
      _$_HymnsModel.fromJson;

  @override
  int? get id;
  @override
  String get title;
  @override
  String get hymn;
  @override
  @JsonKey(ignore: true)
  _$$_HymnsModelCopyWith<_$_HymnsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
