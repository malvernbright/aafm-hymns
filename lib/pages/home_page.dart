import 'package:aafm_hymns/providers/hymn_provider.dart';
import 'package:aafm_hymns/utils/colors.dart';
import 'package:aafm_hymns/utils/constants.dart';
import 'package:aafm_hymns/widgets/app_button.dart';
import 'package:aafm_hymns/widgets/exit_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import 'about.dart';
import 'favourite_hymns.dart';
import 'hymns_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    HymnsList(),
    Favourites(),
    // Readings(),
    About(),
  ];



  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope<Object?>(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) {
          return;
        }
        final bool shouldPop = await ExitApp.exitApp(context);
        if (context.mounted && shouldPop) {
          SystemNavigator.pop();
        }
      },
      child: Consumer<HymnProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            body: SafeArea(
              child: Center(
                child: _widgetOptions.elementAt(provider.selectedIndex),
              ),
            ),
            bottomNavigationBar: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20,
                        color: Colors.black.withValues(alpha: .1),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 8),
                    child: GNav(
                      rippleColor: Colors.grey[300]!,
                      hoverColor: Colors.grey[100]!,
                      gap: 8,
                      activeColor: Colors.pink,
                      iconSize: 24,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                      duration: const Duration(milliseconds: 400),
                      tabBackgroundColor: Colors.grey[100]!,
                      color: Colors.white,
                      style: GnavStyle.google,
                      tabs: const [
                        GButton(
                          icon: LineIcons.school,
                          text: 'Hymns',
                        ),
                        GButton(
                          icon: LineIcons.heart,
                          text: 'Likes',
                        ),
                        // GButton(
                        //   icon: LineIcons.school,
                        //   text: 'Readings',
                        // ),
                        GButton(
                          icon: LineIcons.infoCircle,
                          text: 'About',
                        ),
                      ],
                      selectedIndex: provider.selectedIndex,
                      onTabChange: (index) {
                        provider.onTabChanged(index);
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<bool?> _showBackDialog() {
    return showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('Are you sure you want to exit?'),
            actions: [
              AppButton(
                text: 'Never mind',
                color: AppColors.red,
                onTap: () {
                  Navigator.pop(context, false);
                },
              ),
              AppButton(
                text: 'Yes',
                color: AppColors.bluishWhite,
                onTap: () {
                  SystemNavigator.pop();
                },
              )
            ],
          );
        });
  }
}
