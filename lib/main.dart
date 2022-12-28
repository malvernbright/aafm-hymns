import 'dart:io';
import 'package:aafm_hymns/pages/splash_screen.dart';
import 'package:aafm_hymns/providers/hymn_provider.dart';
import 'package:aafm_hymns/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'data/repositories/hymns_repository.dart';
import 'models/favourites.dart';
import 'models/hymn_model.dart';

// HymnsRepositoryImpl
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory documents = await path_provider.getApplicationDocumentsDirectory();
  // await Hive.openBox(darkModeBox);
  await Hive.openBox(favourites);
  runApp(MultiRepositoryProvider(
    providers: [
      RepositoryProvider(
        create: (context) => HymnsRepositoryImpl(),
      ),
    ],
    child: MaterialApp(
      builder: (context, child) {
        return Directionality(textDirection: TextDirection.ltr, child: child!);
      },
      title: 'AAFM HYMNS',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
              .copyWith(secondary: Colors.pink),
          textSelectionTheme: TextSelectionThemeData(
              selectionColor: Colors.pink.shade500,
              selectionHandleColor: Colors.pink.shade500)),
      home: const SplashScreen(),
    ),
  ));
}
