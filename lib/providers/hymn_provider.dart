import 'dart:convert';

import 'package:aafm_hymns/models/favourites.dart';
import 'package:aafm_hymns/models/menu_items.dart';
import 'package:aafm_hymns/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
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

  Future<bool> checkFavourite(int index) async {
    if (Hive.box(favourites).containsKey(index)) return true;
    return false;
  }

  List hymns = [];
  Future<List> readJson() async {
    final String response =
        await rootBundle.loadString('assets/hymns/hymns.json');
    final data = await json.decode(response);
    hymns = data['items'];
    return hymns;
    // notifyListeners();
  }
}
