import 'package:aafm_hymns/models/favourites.dart';
import 'package:aafm_hymns/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HymnProvider with ChangeNotifier {
  double myFontSize = 12.0;
  TextEditingController editingController = TextEditingController();
  List itemSearch = [];

  int selectedIndex = 0;

  bool darkModeBoxChecked = false;

  void increaseFontSize() {
    myFontSize++;
    notifyListeners();
  }

  void reduceFontSize() {
    myFontSize--;
    notifyListeners();
  }

  // selectedIndex: _selectedIndex,
  // onTabChange: (index) {
  // setState(() {
  // _selectedIndex = index;
  // });

  void onTabChanged(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  void addToFavorites(
      {required String title, required String hymn, required int index}) async {
    var box = await Hive.openBox(favourites);
    var favouriteHymns = FavouriteHymns(title, hymn);
    if (box.containsKey(index)) {
      print('Hymn already added');
      box.delete(index);
    } else {
      box.put(index, favouriteHymns);
    }
    print(box.keys);
    notifyListeners();
  }

  void darkMode() async {
    var box = await Hive.openBox(darkModeBox);
    if (box.containsKey('darkMode')) {
      darkModeBoxChecked = !darkModeBoxChecked;
      box.put('darkMode', darkModeBoxChecked);
      notifyListeners();
    } else {
      box.delete('darkMode');
      notifyListeners();
    }
  }

  Future<bool> checkFavourite(int index) async {
    if (Hive.box(favourites).containsKey(index)) return true;
    return false;
  }
}
