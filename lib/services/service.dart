import 'dart:convert';

import 'package:aafm_hymns/models/hymn_model.dart';
import 'package:flutter/services.dart';

class Services {
  static const String _hymnsAsset = 'assets/hymns/hymns.json';
  static String get hymnsBundle => _hymnsAsset;
  late List<HymnsModel> hymnsList;
  late List<HymnsModel> filteredHymnsList;
  static Future<List<HymnsModel>> getHymnsList() async {
    try {
      final jsonData = await rootBundle.loadString(hymnsBundle);
      // var list = HymnsModel.fromJson(jsonData);
      List<HymnsModel> list = parseHymns(jsonData);
      return list;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<List<HymnsModel>> searchHymn(String value) async {
    value = value.toLowerCase();
    try {
      final jsonData = await rootBundle.loadString(hymnsBundle);
      List<HymnsModel> list = parseHymns(jsonData);
      var hymns = list
          .where((element) => (element.id.contains(value) ||
              element.title.toLowerCase().contains(value) ||
              element.hymn.toLowerCase().contains(value)))
          .toList();
      return hymns;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<HymnsModel> parseHymns(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<HymnsModel>((json) => HymnsModel.fromJson(json)).toList();
  }
}
