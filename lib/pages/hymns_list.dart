import 'package:aafm_hymns/providers/hymn_provider.dart';
import 'package:aafm_hymns/services/service.dart';
import 'package:aafm_hymns/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:hive/hive.dart';
import '../widgets/search_widget.dart';
import 'hymn.dart';

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
                return Scaffold(
                  body: CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        floating: true,
                        pinned: true,
                        snap: false,
                        centerTitle: false,
                        title: const Text('AAFM HYMNS'),
                        bottom: AppBar(
                          title: const SizedBox(
                            width: double.infinity,
                            height: 40,
                            child: Center(
                              child: SearchWidget(),
                            ),
                          ),
                        ),
                      ),
                      SliverList(
                          delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          int parsedId = int.parse(
                              '${provider.filteredUsers.isEmpty ? provider.users[index].id : provider.filteredUsers[index].id}');
                          String title =
                              '${provider.filteredUsers.isEmpty ? provider.users[index].title : provider.filteredUsers[index].title}';
                          String hymn =
                              '${provider.filteredUsers.isEmpty ? provider.users[index].hymn : provider.filteredUsers[index].hymn}';
                          return Card(
                            child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.pink,
                                  child: Text(
                                    '$parsedId',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                                title: Text(title),
                                trailing: IconButton(
                                  icon: Icon(
                                    Hive.box(favourites).containsKey(index + 1)
                                        ? LineIcons.heartAlt
                                        : LineIcons.heart,
                                    color: Colors.pinkAccent,
                                    size: 35,
                                  ),
                                  onPressed: () => provider.addToFavorites(
                                      hymn: hymn,
                                      title: title,
                                      context: context,
                                      id: parsedId),
                                ),
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => Hymn(
                                        title: title = title,
                                        hymn: hymn,
                                        id: parsedId,
                                      ),
                                    ),
                                  );
                                }),
                          );
                        },
                        childCount: provider.filteredUsers.isEmpty
                            ? provider.users.length
                            : provider.filteredUsers.length,
                      ))
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return const Icon(Icons.error_outline);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            });
      },
    );
  }
}
