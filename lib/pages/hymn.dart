import 'package:aafm_hymns/providers/hymn_provider.dart';
import 'package:aafm_hymns/widgets/action_bar_icon.dart';
import 'package:aafm_hymns/widgets/floating_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Hymn extends StatefulWidget {
  final int id;
  final String title;
  final String hymn;
  const Hymn(
      {Key? key, required this.title, required this.hymn, required this.id})
      : super(key: key);

  @override
  State<Hymn> createState() => _HymnState();
}

class _HymnState extends State<Hymn> {
  late final WebViewController _controller;
  late int id;
  late String title;
  late String hymn;
  @override
  void initState() {
    id = widget.id;
    title = widget.title;
    hymn = widget.hymn;
    _controller = WebViewController();
    _controller.loadFlutterAsset(hymn);
    _controller.enableZoom(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HymnProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            actions: [
              IconButton(
                  onPressed: () => provider.addToFavorites(
                      hymn: hymn, title: title, context: context, id: id),
                  icon: ActionBarIcon(index: id))
            ],
          ),
          body: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            width: MediaQuery.of(context).size.width,
            child: WebViewWidget(controller: _controller),
            // SelectableText(
            //   widget.hymn,
            //   style: TextStyle(fontSize: provider.myFontSize),
            // ),
          ),
          // floatingActionButton: const FloatingButton(),
        );
      },
    );
  }
}
