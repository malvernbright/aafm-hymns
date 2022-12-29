import 'package:freezed_annotation/freezed_annotation.dart';

part 'hymn_model.freezed.dart';
part 'hymn_model.g.dart';

@freezed
class HymnsModel with _$HymnsModel {
  const factory HymnsModel({
    required String id,
    required String title,
    required String hymn,
  }) = _HymnsModel;

  factory HymnsModel.fromJson(Map<String, dynamic> json) =>
      _$HymnsModelFromJson(json);
}
