import 'package:freezed_annotation/freezed_annotation.dart';

part 'favourites.freezed.dart';
part 'favourites.g.dart';

@freezed
class FavouriteHymns with _$FavouriteHymns {
  const factory FavouriteHymns({
    int? id,
    required String title,
    required String hymn,
  }) = _FavouriteHymns;

  factory FavouriteHymns.fromJson(Map<String, dynamic> json) =>
      _$FavouriteHymnsFromJson(json);
}
//flutter packages pub run build_runner build
