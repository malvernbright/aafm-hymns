import 'package:aafm_hymns/pages/hymn.dart';
import 'package:aafm_hymns/providers/hymn_provider.dart';
import 'package:aafm_hymns/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:line_icons/line_icons.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:provider/provider.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Consumer<HymnProvider>(
      builder: (context, provider, child) {
        return FloatingSearchBar(
          implicitCurve: Curves.easeInCirc,
          controller: FloatingSearchBarController(),
          hint: 'Search Hymn...',
          clearQueryOnClose: true,
          scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
          transitionDuration: const Duration(milliseconds: 800),
          transitionCurve: Curves.easeInCirc,
          physics: const BouncingScrollPhysics(),
          axisAlignment: isPortrait ? 0.0 : -1.0,
          openAxisAlignment: 0.0,
          width: isPortrait ? 600 : 500,
          debounceDelay: const Duration(milliseconds: 500),
          onQueryChanged: (query) {
            // Call your model, bloc, controller here.
            provider.onSearchChanged(query);
          },
          // Specify a custom transition to be used for
          // animating between opened and closed stated.
          transition: CircularFloatingSearchBarTransition(),
          actions: [
            FloatingSearchBarAction(
              showIfOpened: false,
              child: CircularButton(
                icon: const Icon(LineIcons.search, color: Colors.green),
                onPressed: () {},
              ),
            ),
            FloatingSearchBarAction.searchToClear(
              showIfClosed: false,
            ),
          ],
          builder: (context, transition) {
            return Consumer<HymnProvider>(
              builder: (context, provider, child) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Material(
                      color: Colors.white,
                      elevation: 4.0,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: provider.filteredUsers.isEmpty
                              ? provider.users.length
                              : provider.filteredUsers.length,
                          itemBuilder: (context, index) {
                            int parsedId = int.parse(
                                '${provider.filteredUsers.isEmpty ? provider.users[index].id : provider.filteredUsers[index].id}');
                            String title = provider.filteredUsers.isEmpty
                                ? provider.users[index].title
                                : provider.filteredUsers[index].title;
                            String hymn = provider.filteredUsers.isEmpty
                                ? provider.users[index].hymn
                                : provider.filteredUsers[index].hymn;
                            return Card(
                              child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.pink,
                                    child: Text(
                                      '$parsedId',
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  title: Text(title),
                                  trailing: IconButton(
                                    icon: Icon(
                                      Hive.box(favourites)
                                              .containsKey(index + 1)
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
                          })),
                );
              },
            );
          },
          body: Consumer<HymnProvider>(
            builder: (context, provider, child) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Material(
                    color: Colors.white,
                    elevation: 4.0,
                    child: Container(
                      padding: const EdgeInsets.only(top: 50),
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: provider.filteredUsers.isEmpty
                              ? provider.users.length
                              : provider.filteredUsers.length,
                          itemBuilder: (context, index) {
                            int parsedId = int.parse(
                                '${provider.filteredUsers.isEmpty ? provider.users[index].id : provider.filteredUsers[index].id}');
                            String title = provider.filteredUsers.isEmpty
                                ? provider.users[index].title
                                : provider.filteredUsers[index].title;
                            String hymn = provider.filteredUsers.isEmpty
                                ? provider.users[index].hymn
                                : provider.filteredUsers[index].hymn;
                            return Card(
                              child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.pink,
                                    child: Text(
                                      '$parsedId',
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  title: Text(title),
                                  trailing: IconButton(
                                    icon: Icon(
                                      Hive.box(favourites)
                                              .containsKey(index + 1)
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
                          }),
                    )),
              );
            },
          ),
        );
      },
    );
  }
}
