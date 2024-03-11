import 'package:aafm_hymns/models/favourites.dart';
import 'package:aafm_hymns/models/hymn_model.dart';
import 'package:aafm_hymns/services/service.dart';
import 'package:aafm_hymns/utils/constants.dart';
import 'package:aafm_hymns/widgets/lovely_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class HymnProvider with ChangeNotifier {
  double myFontSize = 14.0;
  TextEditingController searchController = TextEditingController();
  late Future<List<HymnsModel>> hymnsList;
  late Future<List<HymnsModel>> filteredHymnsList;
  int selectedIndex = 0;

  Future<List<HymnsModel>> get getHymnsList => Services.getHymnsList();

  Future<List<HymnsModel>> onSearchChanged(String value) {
    return Services.searchHymn(value).whenComplete(() => notifyListeners());
  }

  void increaseFontSize() {
    myFontSize++;
    notifyListeners();
  }

  void reduceFontSize() {
    myFontSize--;
    notifyListeners();
  }

  void onTabChanged(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  void addToFavorites({
    required String title,
    required String hymn,
    required int id,
    required context,
  }) async {
    final box = await Hive.openBox(favourites);
    final favouriteHymns = FavouriteHymns(id, title, hymn);
    if (box.containsKey(id)) {
      LovelySnackBar.showSnackBar(
        title: 'Success!',
        message: '$title is no longer in your favourites list',
        context: context,
        contentType: ContentType.success,
      );
      box.delete(id);

      notifyListeners();
    } else {
      box.put(id, favouriteHymns);
      LovelySnackBar.showSnackBar(
        title: 'Success!',
        message: 'You\'ve added $title to your favourites list',
        context: context,
        contentType: ContentType.success,
      );

      notifyListeners();
    }
  }
}
