import 'package:flutter/material.dart';

class Hymn extends StatelessWidget {
  final String title;
  final String hymn;
  const Hymn({Key? key, required this.title, required this.hymn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: MediaQuery.of(context).size.width * .85,
        child: SelectableText(hymn),
      ),
    );
  }
}
