import 'package:aafm_hymns/providers/hymn_provider.dart';
import 'package:aafm_hymns/utils/constants.dart';
import 'package:aafm_hymns/widgets/floating_button.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:hive/hive.dart';

class Hymn extends StatelessWidget {
  final int id;
  final String title;
  final String hymn;
  const Hymn(
      {Key? key, required this.title, required this.hymn, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HymnProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(title),
            actions: [
              IconButton(
                  onPressed: () => provider.addToFavorites(
                      hymn: hymn, title: title, context: context, id: id),
                  icon: Icon(
                    Hive.box(favourites).containsKey(id)
                        ? LineIcons.heartAlt
                        : LineIcons.heart,
                    color: Colors.white,
                  ))
            ],
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
