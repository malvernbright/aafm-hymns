import 'dart:convert';
import 'dart:io';
import 'package:aafm_hymns/models/hymn_model.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class HymnsRepository {
  /// Throws [HymnsNotLoadedException]
  Future<List<HymnsModel>> fetchHymns();
  void onSearchChanged(String value);
}

class HymnsRepositoryImpl implements HymnsRepository {
  List<HymnsModel> hymns = [];
  List<HymnsModel> filteredHymns = [];

  @override
  Future<List<HymnsModel>> fetchHymns() async {
    // Read json file to list
    final jsonData = await rootBundle.loadString('assets/hymns/hymns.json');
    final list = json.decode(jsonData) as List<dynamic>;
    return list.map((e) => HymnsModel.fromJson(e)).toList();
  }

  @override
  void onSearchChanged(String value) {
    if (value.isEmpty) {
      filteredHymns = hymns;
    } else {
      filteredHymns = hymns
          .where((u) => (u.id.toString().contains(value) ||
              u.title.toLowerCase().contains(value.toLowerCase()) ||
              u.hymn.toLowerCase().contains(value.toLowerCase())))
          .toList();
    }
  }
}

class HymnsNotLoadedException implements Exception {}
