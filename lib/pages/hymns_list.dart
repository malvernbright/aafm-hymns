import 'dart:convert';

import 'package:aafm_hymns/models/hymn_model.dart';
import 'package:aafm_hymns/services/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as root_bundle;
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

import 'hymn.dart';

class HymnsList extends StatefulWidget {
  const HymnsList({Key? key}) : super(key: key);

  @override
  _HymnsListState createState() => _HymnsListState();
}

class _HymnsListState extends State<HymnsList> {
  List<HymnsModel> users = [];
  List<HymnsModel> filteredUsers = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    Services.getUsers().then((value) {
      setState(() {
        users = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              title: SizedBox(
                width: double.infinity,
                height: 40,
                child: Center(
                  child: buildSearchWidget(),
                ),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) => Card(
              child: ListTile(
                  title: Text(
                      '${filteredUsers.isEmpty ? users[index].title : filteredUsers[index].title}'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => Hymn(
                            title:
                                '${filteredUsers.isEmpty ? users[index].title : filteredUsers[index].title}',
                            hymn:
                                '${filteredUsers.isEmpty ? users[index].hymn : filteredUsers[index].hymn}'),
                      ),
                    );
                  }),
            ),
            childCount:
                filteredUsers.isEmpty ? users.length : filteredUsers.length,
          ))
        ],
      ),
    );
  }

  TextField buildSearchWidget() {
    return TextField(
      controller: searchController,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintStyle: const TextStyle(color: Colors.white),
        hintText: 'Search',
        border: const OutlineInputBorder(),
        suffixIcon: LineIcon(
          LineIcons.search,
          color: Colors.white,
        ),
        contentPadding: const EdgeInsets.all(15.0),
      ),
      onChanged: (string) {
        if (string.isEmpty) {
          setState(() {
            filteredUsers = users;
          });
        } else {
          setState(() {
            filteredUsers = users
                .where((u) =>
                    (u.title!.toLowerCase().contains(string.toLowerCase()) ||
                        u.hymn!.toLowerCase().contains(string.toLowerCase())))
                .toList();
          });
        }
      },
    );
  }

  Future<List<HymnsModel>> readJsonData() async {
    final jsonData =
        await root_bundle.rootBundle.loadString('assets/hymns/hymns.json');
    final list = json.decode(jsonData) as List<dynamic>;

    return list.map((e) => HymnsModel.fromJson(e)).toList();
  }
}
