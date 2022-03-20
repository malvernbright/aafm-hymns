import 'dart:convert';

import 'package:aafm_hymns/models/hymn_model.dart';
import 'package:flutter/services.dart';

class Services {
  static Future<List<HymnsModel>> getHymnsList() async {
    try {
      final jsonData = await rootBundle.loadString('assets/hymns/hymns.json');
      // var list = HymnsModel.fromJson(jsonData);
      List<HymnsModel> list = parseHymns(jsonData);
      return list;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<HymnsModel> parseHymns(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<HymnsModel>((json) => HymnsModel.fromJson(json)).toList();
  }
}
