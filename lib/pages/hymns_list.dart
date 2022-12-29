import 'package:aafm_hymns/providers/hymn_provider.dart';
import 'package:aafm_hymns/services/service.dart';
import 'package:aafm_hymns/widgets/search_bar_widget.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import '../data/blocs/hymns/hymns_bloc.dart';
import '../data/repositories/hymns_repository.dart';
import 'hymn.dart';

class HymnsList extends StatelessWidget {
  const HymnsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HymnsBloc(
        hymnsRepositoryImpl:
            RepositoryProvider.of<HymnsRepositoryImpl>(context),
      )..add(LoadHymnsEvent()),
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
                appBar: EasySearchBar(
                  title: const Text('AAFM HYMNS'),
                  onSearch: (value) {},
                  backgroundColor: Colors.green,
                  titleTextStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  searchBackgroundColor: Colors.grey[300],
                ),
                body: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Material(
                      color: Colors.white,
                      elevation: 4.0,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.hymns.length,
                          itemBuilder: (context, index) {
                            String parsedId = state.hymns[index].id;
                            String title = state.hymns[index].title;
                            String hymn = state.hymns[index].hymn;
                            return Card(
                              child: ListTile(
                                  leading: const CircleAvatar(
                                    backgroundColor: Colors.pink,
                                    child: Text(
                                      '',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  title: Text(title),
                                  trailing: IconButton(
                                      icon: Icon(
                                        // Hive.box(favourites)
                                        //         .containsKey(index + 1)
                                        //     ? LineIcons.heartAlt
                                        // :
                                        LineIcons.heart,
                                        color: Colors.pinkAccent,
                                        size: 35,
                                      ),
                                      onPressed: () {
                                        //  provider.addToFavorites(
                                        //   hymn: hymn,
                                        //   title: title,
                                        //   context: context,
                                        //   id: parsedId);
                                      }),
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) => Hymn(
                                          title: title,
                                          hymn: hymn,
                                          id: parsedId,
                                        ),
                                      ),
                                    );
                                  }),
                            );
                          })),
                ));
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
  }
}
