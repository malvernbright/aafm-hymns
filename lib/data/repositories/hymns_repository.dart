import 'dart:convert';
import 'package:aafm_hymns/models/favourites.dart';
import 'package:aafm_hymns/models/hymn_model.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/constants.dart';

abstract class HymnsRepository {
  /// Throws [HymnsNotLoadedException]
  Future<List<HymnsModel>> fetchHymns(String value);
  // void addToFavorites(
  //     {required String title, required String hymn, required String id});
  // void onSearchChanged(String value);
}

class HymnsRepositoryImpl implements HymnsRepository {
  List<HymnsModel> hymns = [];
  List<HymnsModel> filteredHymns = [];
  double fontSize = 14.0;
  // @override
  // Future<List<HymnsModel>> fetchHymns() async {
  //   // Read json file to list
  //   final jsonData = await rootBundle.loadString('assets/hymns/hymns.json');
  //   final list = json.decode(jsonData) as List<dynamic>;
  //   hymns = list.map((e) => HymnsModel.fromJson(e)).toList();
  //   return hymns;
  // }

  @override
  Future<List<HymnsModel>> fetchHymns(String value) async {
    // fetchHymns();
    final jsonData = await rootBundle.loadString('assets/hymns/hymns.json');
    final list = json.decode(jsonData) as List<dynamic>;
    hymns = list.map((hymnsList) => HymnsModel.fromJson(hymnsList)).toList();
    if (value.isNotEmpty) {
      filteredHymns = hymns.where((hymn) {
        final input = value.toLowerCase();
        final id = hymn.id.toLowerCase();
        final title = hymn.title.toLowerCase();
        final name = hymn.hymn.toLowerCase();
        return (id.contains(input) ||
            title.contains(input) ||
            name.contains(input));
      }).toList();
      filteredHymns.forEach((element) {
        print(element.title);
      });
      return filteredHymns;
    } else {
      return hymns;
    }
  }

  @override
  void addToFavorites(
      {required String title, required String hymn, required String id}) async {
    var box = await Hive.openBox(favourites);
    var favouriteHymns = FavouriteHymns(title: title, hymn: hymn, id: id);
    if (box.containsKey(id)) {
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     content: Text('$title is no longer in your favourites list')));
      box.delete(id);
    } else {
      box.put(id, favouriteHymns);
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     content: Text('You\'ve added $title to your favourites list')));

      // notifyListeners();
    }
  }
}

class HymnsNotLoadedException implements Exception {}
