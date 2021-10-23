import 'dart:convert';

import 'package:aafm_hymns/models/favourites.dart';
import 'package:aafm_hymns/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  void onTabChanged(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  void addToFavorites(
      {required String title,
      required String hymn,
      required int index,
      required BuildContext context}) async {
    var box = await Hive.openBox(favourites);
    var favouriteHymns = FavouriteHymns(title, hymn);
    if (box.containsKey(index)) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('$title is no longer in your favourites list')));
      box.delete(index);
      notifyListeners();
    } else {
      box.put(index, favouriteHymns);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('You\'ve added $title to your favourites list')));

      notifyListeners();
    }
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
}
