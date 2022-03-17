import 'package:aafm_hymns/models/favourites.dart';
import 'package:aafm_hymns/pages/hymn.dart';
import 'package:aafm_hymns/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class Favourites extends StatelessWidget {
  const Favourites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Hive.openBox(favourites),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Favourites'),
              ),
              body: ValueListenableBuilder(
                valueListenable: Hive.box(favourites).listenable(),
                builder: (context, Box favouritesBox, _) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: ListView.builder(
                        itemCount: favouritesBox.length,
                        itemBuilder: (context, index) {
                          final hymns =
                              favouritesBox.getAt(index) as FavouriteHymns;
                          return Card(
                            child: ListTile(
                              title: Text(hymns.title.toString()),
                              onTap: () =>
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => Hymn(
                                            title: hymns.title,
                                            hymn: hymns.hymn, id: hymns.id,
                                            // index: index,
                                          ),),),
                            ),
                          );
                        }),
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(child: Icon(Icons.error_outline));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
