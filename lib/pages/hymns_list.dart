import 'dart:convert';

import 'package:aafm_hymns/pages/hymn.dart';
import 'package:flutter/material.dart';

class HymnsList extends StatelessWidget {
  const HymnsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _scrollController = FixedExtentScrollController();
    return FutureBuilder(
      future:
          DefaultAssetBundle.of(context).loadString('assets/hymns/hymns.json'),
      builder: (context, snapshot) {
        var hymnData = json.decode(snapshot.data.toString());
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView.builder(
            itemCount: hymnData.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    backgroundColor: Colors.green,
                  ),
                  title: Text('${hymnData[index]['title']}'),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => Hymn(
                          title: '${hymnData[index]['title']}',
                          hymn: '${hymnData[index]['hymn']}'))),
                ),
              );
            },
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
