import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

// part 'favourites.freezed.dart';
part 'favourites.g.dart';

// @freezed
// class FavouriteHymns with _$FavouriteHymns {
//   const factory FavouriteHymns({
//     required String id,
//     required String title,
//     required String hymn,
//   }) = _FavouriteHymns;

//   factory FavouriteHymns.fromJson(Map<String, dynamic> json) =>
//       _$FavouriteHymnsFromJson(json);
// }
//flutter packages pub run build_runner build

@HiveType(typeId: 0)
class FavouriteHymns {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String hymn;
  FavouriteHymns(
      {required this.id, required this.title, required this.hymn, required});
}
