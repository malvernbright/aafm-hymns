import 'package:aafm_hymns/providers/hymn_provider.dart';
import 'package:aafm_hymns/services/service.dart';
import 'package:aafm_hymns/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HymnsList extends StatelessWidget {
  const HymnsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HymnProvider>(
      builder: (context, provider, child) {
        return FutureBuilder(
          future: Services.getUsers().then((value) => provider.users = value),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return const Scaffold(body: SearchBarWidget());
            } else if (snapshot.hasError) {
              return const Icon(Icons.error_outline);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        );
      },
    );
  }
}
