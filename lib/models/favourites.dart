import 'package:hive/hive.dart';
part 'favourites.g.dart';

@HiveType(typeId: 0)
class FavouriteHymns extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String hymn;

  FavouriteHymns(this.id, this.title, this.hymn);
}
//flutter packages pub run build_runner build
