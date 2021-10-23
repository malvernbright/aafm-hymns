import 'dart:convert';

import 'package:aafm_hymns/models/favourites.dart';
import 'package:aafm_hymns/models/hymn_model.dart';
import 'package:aafm_hymns/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

class HymnProvider with ChangeNotifier {
  double myFontSize = 14.0;
  TextEditingController searchController = TextEditingController();
  List<HymnsModel> users = [];
  List<HymnsModel> filteredUsers = [];
  int selectedIndex = 0;

  Future<List<HymnsModel>> readJsonData() async {
    // Read json file to list
    final jsonData = await rootBundle.loadString('assets/hymns/hymns.json');
    final list = json.decode(jsonData) as List<dynamic>;

    return list.map((e) => HymnsModel.fromJson(e)).toList();
  }

  void onSearchChanged(String value) {
    if (value.isEmpty) {
      filteredUsers = users;
    } else {
      filteredUsers = users
          .where((u) => (u.id.toString().contains(value) ||
              u.title!.toLowerCase().contains(value.toLowerCase()) ||
              u.hymn!.toLowerCase().contains(value.toLowerCase())))
          .toList();
    }
    notifyListeners();
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
}
