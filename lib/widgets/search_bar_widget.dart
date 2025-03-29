import 'package:aafm_hymns/models/hymn_model.dart';
import 'package:aafm_hymns/pages/hymn.dart';
import 'package:aafm_hymns/providers/hymn_provider.dart';
import 'package:aafm_hymns/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:line_icons/line_icons.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import 'package:provider/provider.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  late FloatingSearchBarController _searchController;
  @override
  void initState() {
    _searchController = FloatingSearchBarController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
        body: Consumer<HymnProvider>(builder: (context, provider, child) {
      return FloatingSearchBar(
        implicitCurve: Curves.easeInCirc,
        controller: _searchController,
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
          _searchController.query = query;
          provider.onSearchChanged(_searchController.query);
        },
        // Specify a custom transition to be used for
        // animating between opened and closed stated.
        transition: CircularFloatingSearchBarTransition(),
        actions: [
          FloatingSearchBarAction.searchToClear(
            showIfClosed: false,
          )
        ],
        builder: (context, transition) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Material(
                color: Colors.white,
                elevation: 4.0,
                child: FutureBuilder(
                    future: provider.onSearchChanged(_searchController.query),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.green,
                          ),
                        );
                      }
                      if (snapshot.hasData) {
                        final List<HymnsModel> hymns = snapshot.data;
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: hymns.length,
                            itemBuilder: (context, index) {
                              int id = int.parse(hymns[index].id);
                              String title = hymns[index].title;
                              String hymn = hymns[index].hymn;
                              return Card(
                                child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: Colors.pink,
                                      child: Text(
                                        '$id',
                                        style: const TextStyle(
                                            color: Colors.white),
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
                                          id: id),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (_) => Hymn(
                                            title: title = title,
                                            hymn: hymn,
                                            id: id,
                                          ),
                                        ),
                                      );
                                    }),
                              );
                            });
                      }
                      if (snapshot.hasError) {}
                      return const CircularProgressIndicator(
                        color: Colors.pink,
                      );
                    })),
          );
        },
        body: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Material(
                color: Colors.white,
                elevation: 0,
                child: FutureBuilder(
                    future: provider.getHymnsList,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.green,
                          ),
                        );
                      }
                      if (snapshot.hasData) {
                        final List<HymnsModel> hymns = snapshot.data;
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: hymns.length,
                            itemBuilder: (context, index) {
                              int id = int.parse(hymns[index].id);
                              String title = hymns[index].title;
                              String hymn = hymns[index].hymn;
                              return Card(
                                child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: Colors.pink,
                                      child: Text(
                                        '$id',
                                        style: const TextStyle(
                                            color: Colors.white),
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
                                          id: id),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (_) => Hymn(
                                            title: title = title,
                                            hymn: hymn,
                                            id: id,
                                          ),
                                        ),
                                      );
                                    }),
                              );
                            });
                      }
                      if (snapshot.hasError) {}
                      return const CircularProgressIndicator(
                        color: Colors.pink,
                      );
                    })),
          ),
        ),
      );
    }));
  }
}
