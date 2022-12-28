import 'dart:convert';
import 'dart:io';
import 'package:aafm_hymns/models/hymn_model.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class HymnsRepository {
  /// Throws [HymnsNotLoadedException]
  Future<List<HymnsModel>> fetchHymns();
}

class HymnsRepositoryImpl implements HymnsRepository {
  @override
  Future<List<HymnsModel>> fetchHymns() async {
    final jsonString = await rootBundle.loadString('assets/hymns/hymns.json');
    final hymnsMap = jsonDecode(jsonString);
    final hymns = hymnsMap.map((json) => HymnsModel.fromJson(json));
    print(hymns);
    return hymns;
  }
}

class HymnsNotLoadedException implements Exception {}
