import 'package:aafm_hymns/models/hymn_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

import '../data/blocs/hymns/hymns_bloc.dart';
import '../data/blocs/search_hymn/search_hymn_bloc.dart';
import '../data/repositories/hymns_repository.dart';
import '../utils/constants.dart';
import 'hymn_page.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filteredHymns = RepositoryProvider.of<HymnsRepositoryImpl>(context);
    String searchString = '';
    return BlocProvider<SearchHymnBloc>(
      create: (context) => SearchHymnBloc(HymnsRepositoryImpl()),
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Center(
                child: TextField(
                    autofocus: true,
                    onChanged: ((value) {
                      searchString = value;
                      filteredHymns.fetchHymns(searchString);
                    }),
                    textAlign: TextAlign.center,
                    autocorrect: false,
                    decoration: const InputDecoration(
                        hintText: 'Search hymn...', border: InputBorder.none))),
          ),
        ),
        body: BlocBuilder<HymnsBloc, HymnsState>(
          builder: (context, state) {
            if (state is HymnSearchedState) {
              ListView.builder(
                  itemCount: filteredHymns.filteredHymns.isEmpty
                      ? filteredHymns.hymns.length
                      : filteredHymns.filteredHymns.length,
                  itemBuilder: (_, index) {
                    final hymn = filteredHymns.hymns[index];
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.pink.shade500,
                          child: Text(hymn.id),
                        ),
                        title: Text(hymn.title),
                      ),
                    );
                  });
            }
            return Container();
          },
        ),
      ),
    );
  }
}
