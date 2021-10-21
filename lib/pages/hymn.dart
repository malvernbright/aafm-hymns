import 'package:aafm_hymns/providers/hymn_provider.dart';
import 'package:aafm_hymns/utils/constants.dart';
import 'package:aafm_hymns/widgets/action_bar_icon.dart';
import 'package:aafm_hymns/widgets/floating_button.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class Hymn extends StatelessWidget {
  const Hymn(
      {Key? key, required this.title, required this.hymn, required this.index})
      : super(key: key);
  final String title;
  final String hymn;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<HymnProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: SelectableText(title),
            actions: [
              IconButton(
                  onPressed: () => provider.addToFavorites(
                      title: title, hymn: hymn, index: index, context: context),
                  icon: ActionBarIcon(index: index))
            ],
            leading: IconButton(
              icon: const Icon(
                Icons.keyboard_arrow_left,
                size: 35,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          floatingActionButton: const FloatingButton(),
          body: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SingleChildScrollView(
              child: SelectableText(
                hymn,
                style: TextStyle(fontSize: provider.myFontSize),
              ),
            ),
          ),
        );
      },
    );
  }
}
