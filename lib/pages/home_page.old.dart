import 'package:aafm_hymns/providers/hymn_provider.dart';
import 'package:aafm_hymns/widgets/exit_app.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import 'about.dart';
import 'favourite_hymns.dart';
import 'hymns_list.dart';

class HomePage extends StatelessWidget {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    HymnsList(),
    Favourites(),
    About(),
  ];

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onWillPop(context),
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(0
              // provider.selectedIndex,
              ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.green,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                rippleColor: Colors.grey[300]!,
                hoverColor: Colors.grey[100]!,
                gap: 8,
                activeColor: Colors.pink,
                iconSize: 24,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: const Duration(milliseconds: 400),
                tabBackgroundColor: Colors.grey[100]!,
                color: Colors.white,
                tabs: const [
                  GButton(
                    icon: LineIcons.school,
                    text: 'Hymns',
                  ),
                  GButton(
                    icon: LineIcons.heart,
                    text: 'Likes',
                  ),
                  GButton(
                    icon: LineIcons.infoCircle,
                    text: 'About',
                  ),
                ],
                selectedIndex: 0,
                // provider.selectedIndex,
                onTabChange: (index) {
                  // provider.onTabChanged(index);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
