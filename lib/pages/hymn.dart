import 'package:aafm_hymns/providers/hymn_provider.dart';
import 'package:aafm_hymns/widgets/floating_button.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class Hymn extends StatelessWidget {
  final String title;
  final String hymn;
  const Hymn({Key? key, required this.title, required this.hymn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HymnProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            width: MediaQuery.of(context).size.width,
            child: SelectableText(
              hymn,
              style: TextStyle(fontSize: provider.myFontSize),
            ),
          ),
          floatingActionButton: const FloatingButton(),
        );
      },
    );
  }
}
