import 'package:hive/hive.dart';
part 'favourites.g.dart';

@HiveType(typeId: 0)
class FavouriteHymns extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String hymn;

  FavouriteHymns(this.title, this.hymn);
}
