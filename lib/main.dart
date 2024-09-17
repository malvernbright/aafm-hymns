import 'dart:io';
import 'package:aafm_hymns/pages/splash_screen.dart';
import 'package:aafm_hymns/providers/hymn_provider.dart';
import 'package:aafm_hymns/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'models/favourites.dart';
import 'models/hymn_model.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  Directory documents = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(documents.path);
  Hive.registerAdapter(HymnsModelAdapter());
  Hive.registerAdapter(FavouriteHymnsAdapter());
  // await Hive.openBox(darkModeBox);
  await Hive.openBox(favourites);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
    create: (BuildContext context) => HymnProvider(),
    child: MaterialApp(
      builder: (context, child) {
        return Directionality(textDirection: TextDirection.ltr, child: child!);
      },
      title: 'AAFM HYMNS',
      theme: ThemeData(
          useMaterial3: true,
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
              .copyWith(secondary: Colors.pink),
          textSelectionTheme: TextSelectionThemeData(
              selectionColor: Colors.pink.shade500,
              selectionHandleColor: Colors.pink.shade500)),
      home: const SplashScreen(),
    ),
  ));
}
