import 'package:aafm_hymns/models/hymn_model.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import '../data/blocs/hymns/hymns_bloc.dart';
import '../data/repositories/hymns_repository.dart';
import '../utils/constants.dart';
import 'hymn_page.dart';
import 'search_page.dart';

class HymnsList extends StatelessWidget {
  const HymnsList({Key? key}) : super(key: key);
  static TextEditingController searchController =
      TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Hive.openBox(favourites),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            return BlocProvider(
              create: (context) => HymnsBloc(
                hymnsRepositoryImpl:
                    RepositoryProvider.of<HymnsRepositoryImpl>(context),
                searchText: searchController.text,
              )..add(LoadHymnsEvent(searchText: searchController.text)),
              child: BlocBuilder<HymnsBloc, HymnsState>(
                builder: (context, state) {
                  if (state is HymnsInitial) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      ),
                    );
                  }
                  if (state is HymnsLoadedState) {
                    return Scaffold(
                      body: FloatingSearchBar(
                        hint: 'Search...',
                        scrollPadding:
                            const EdgeInsets.only(top: 10, bottom: 56),
                        transitionDuration: const Duration(milliseconds: 800),
                        transitionCurve: Curves.easeInOut,
                        physics: const BouncingScrollPhysics(),
                        // axisAlignment: isPotrait ? 0.0 : -1.0,
                        openAxisAlignment: 0.0,
                        debounceDelay: const Duration(milliseconds: 500),
                        onQueryChanged: (query) {
                          RepositoryProvider.of<HymnsRepositoryImpl>(context)
                              .fetchHymns(query);
                        },
                        transition: CircularFloatingSearchBarTransition(),
                        actions: [
                          FloatingSearchBarAction(
                            showIfOpened: false,
                            child: CircularButton(
                              onPressed: () {},
                              icon: LineIcon(LineIcons.search),
                            ),
                          ),
                          FloatingSearchBarAction.searchToClear(
                            showIfClosed: false,
                          )
                        ],
                        builder: (_, transition) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Material(
                              color: Colors.white,
                              elevation: 4,
                              child: buildHymnsList(state),
                            ),
                          );
                        },
                        body: Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * .07),
                          child: buildHymnsList(state),
                        ),
                      ),
                    );
                  }
                  if (state is HymnsErrorState) {
                    return Center(
                      child: Column(
                        children: [
                          const Icon(LineIcons.android),
                          Text(state.error),
                        ],
                      ),
                    );
                  }
                  return Container();
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

  ListView buildHymnsList(HymnsLoadedState state) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: state.hymns.length,
        itemBuilder: (context, index) {
          final hymnsRepository =
              RepositoryProvider.of<HymnsRepositoryImpl>(context);
          final loadedHymn = state.hymns[index];
          // String parsedId = state.hymns[index].id;
          // String title = state.hymns[index].title;
          // String hymn = state.hymns[index].hymn;
          return Card(
            child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.pink,
                  child: Text(
                    loadedHymn.id,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                title: Text(loadedHymn.title),
                trailing: IconButton(
                    icon: Icon(
                      Hive.box(favourites).containsKey(loadedHymn.id)
                          ? LineIcons.heartAlt
                          : LineIcons.heart,
                      color: Colors.pinkAccent,
                      size: 35,
                    ),
                    onPressed: () {
                      RepositoryProvider.of<HymnsRepositoryImpl>(context)
                          .addToFavorites(
                              title: loadedHymn.title,
                              hymn: loadedHymn.hymn,
                              id: loadedHymn.id);
                      if (Hive.box(favourites).containsKey(loadedHymn.id)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                '${loadedHymn.title} was removed from your favourites 🤔'),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                '${loadedHymn.title} was added to your favourites 🐣'),
                          ),
                        );
                      }
                    }),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => HymnPage(
                        title: loadedHymn.title,
                        hymn: loadedHymn.hymn,
                        id: loadedHymn.id,
                      ),
                    ),
                  );
                }),
          );
        });
  }
}
