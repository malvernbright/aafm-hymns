import 'package:aafm_hymns/providers/hymn_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Hymn extends StatelessWidget {
  const Hymn({Key? key, required this.title, required this.hymn})
      : super(key: key);
  final String title;
  final String hymn;

  @override
  Widget build(BuildContext context) {
    return Consumer<HymnProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(title),
            leading: IconButton(
              icon: const Icon(
                Icons.keyboard_arrow_left,
                size: 35,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  tooltip: 'Increase Font Size',
                  icon:
                      const Icon(Icons.add, size: 35, color: Colors.blueAccent),
                  onPressed: () => provider.increaseFontSize()),
              IconButton(
                  tooltip: 'Reduce Font Size',
                  icon: const Icon(Icons.remove,
                      size: 35, color: Colors.redAccent),
                  onPressed: () => provider.reduceFontSize()),
            ],
          ),
          body: SingleChildScrollView(
            child: Text(
              hymn,
              style: TextStyle(fontSize: provider.myFontSize),
            ),
          ),
        );
      },
    );
  }
}
