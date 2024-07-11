import 'dart:developer';

import 'package:aafm_hymns/providers/hymn_provider.dart';
import 'package:aafm_hymns/widgets/action_bar_icon.dart';
import 'package:flutter/material.dart';
import 'package:formatted_text/formatted_text.dart';
import 'package:provider/provider.dart';

class Hymn extends StatelessWidget {
  final int id;
  final String title;
  final String hymn;
  const Hymn({
    Key? key,
    required this.title,
    required this.hymn,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HymnProvider>(
      builder: (context, provider, child) {
        return FutureBuilder<String>(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/hymns/$id.txt'),
            builder: (context, snapshot) {
              log(snapshot.data.toString());
              if (snapshot.hasData) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text(title),
                    actions: [
                      IconButton(
                          onPressed: () => provider.addToFavorites(
                              hymn: snapshot.data!,
                              title: title,
                              context: context,
                              id: id),
                          icon: ActionBarIcon(index: id))
                    ],
                  ),
                  body: SingleChildScrollView(
                    child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        width: MediaQuery.of(context).size.width,
                        child: FormattedText(snapshot.data!)
                        // SelectableText(
                        //   widget.hymn,
                        //   style: TextStyle(fontSize: provider.myFontSize),
                        // ),
                        ),
                  ),
                  // floatingActionButton: const FloatingButton(),
                );
              } else {
                return const Material(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.pinkAccent,
                    ),
                  ),
                );
              }
            });
      },
    );
  }
}
