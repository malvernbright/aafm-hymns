import 'package:hive/hive.dart';

part 'hymn_model.g.dart';

@HiveType(typeId: 1)
class HymnsModel extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String hymn;
  HymnsModel({required this.id, required this.title, required this.hymn});

  factory HymnsModel.fromJson(Map<String, dynamic> json) {
    return HymnsModel(
      id: json['id'],
      title: json['title'],
      hymn: json['hymn'],
    );
  }
}
