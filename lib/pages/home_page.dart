import 'package:aafm_hymns/widgets/exit_app.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

import 'about.dart';
import 'favourite_hymns.dart';
import 'hymns_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);

  static final List<Tab> tabs = <Tab>[
    Tab(icon: LineIcon(LineIcons.school)),
    Tab(icon: LineIcon(LineIcons.heart)),
    Tab(icon: LineIcon(LineIcons.info)),
  ];
  static final List<Tab> _widgetOptions = <Tab>[
    const Tab(child: HymnsList()),
    const Tab(child: Favourites()),
    const Tab(child: About()),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _widgetOptions.length,
        child: Builder(
          builder: (_) {
            final TabController? tabController =
                DefaultTabController.of(context);
            tabController?.addListener(() {
              if (!tabController.indexIsChanging) {
                // Your code goes here.
                // To get index of current tab use tabController.index
              }
            });
            return WillPopScope(
              onWillPop: () => onWillPop(context),
              child: Scaffold(
                appBar: AppBar(
                  title: const Text('AAFM HYMNS'),
                  bottom: TabBar(
                    indicatorColor: Colors.pink.shade300,
                    tabs: tabs,
                  ),
                ),
                body: TabBarView(
                  controller: tabController,
                  children: _widgetOptions.map((Tab tab) {
                    final Widget widgetChild = tab.child!;
                    return widgetChild;
                  }).toList(),
                ),
              ),
            );
          },
        ));
  }
}
