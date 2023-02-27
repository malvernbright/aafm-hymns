import 'package:aafm_hymns/widgets/action_bar_icon.dart';
import 'package:aafm_hymns/widgets/floating_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../data/blocs/counter/counter_bloc.dart';
import '../data/blocs/favourite_hymns/favourite_hymns_bloc.dart';
import '../data/repositories/hymns_repository.dart';
import '../utils/constants.dart';

class HymnPage extends StatelessWidget {
  final String id;
  final String title;
  final String hymn;
  const HymnPage(
      {Key? key, required this.title, required this.hymn, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Hive.openBox(favourites),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            return MultiBlocProvider(
                providers: [
                  BlocProvider<CounterBloc>(
                    create: (_) => CounterBloc(),
                  ),
                  BlocProvider<FavouriteHymnsBloc>(
                    create: (_) => FavouriteHymnsBloc(
                        hymnsRepositoryImpl:
                            RepositoryProvider.of<HymnsRepositoryImpl>(context))
                      ..add(AddFavouriteHymnsEvent()),
                  ),
                ],
                child: Scaffold(
                  body: BlocBuilder<FavouriteHymnsBloc, FavouriteHymnsState>(
                    builder: (context, state) {
                      return CustomScrollView(
                        slivers: [
                          SliverAppBar(
                            actions: [
                              IconButton(
                                  onPressed: () {
                                    RepositoryProvider.of<HymnsRepositoryImpl>(
                                            context)
                                        .addToFavorites(
                                            title: title, hymn: hymn, id: id);
                                    if (Hive.box(favourites).containsKey(id)) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                              '$title was removed from your favourites 🤔'),
                                        ),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                              '$title was added to your favourites 🐣'),
                                        ),
                                      );
                                    }
                                  },
                                  icon: ActionBarIcon(index: id))
                            ],
                            pinned: true,
                            snap: true,
                            floating: true,
                            expandedHeight:
                                MediaQuery.of(context).size.height * .13,
                            flexibleSpace: FlexibleSpaceBar(
                              centerTitle: true,
                              title: Text(
                                title,
                                textAlign: TextAlign.center,
                              ),
                              background: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.pink.shade500),
                                  child: Container(
                                    padding: const EdgeInsets.only(top: 30),
                                    margin: const EdgeInsets.only(bottom: 30),
                                    child: Text(
                                      'HYMN $id',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  )),
                            ),
                          ),
                          SliverFillRemaining(
                            child: BlocBuilder<CounterBloc, double>(
                              builder: (context, fontSize) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  width: MediaQuery.of(context).size.width,
                                  child: SelectableText(
                                    hymn,
                                    style: TextStyle(fontSize: fontSize),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      );
                    },
                  ),
                  floatingActionButton: const FloatingButton(),
                ));
          } else if (snapshot.hasError) {
            return const Center(child: Icon(Icons.error_outline));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
