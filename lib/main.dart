import 'dart:io';
import 'package:aafm_hymns/data/blocs/search_hymn/search_hymn_bloc.dart';
import 'package:aafm_hymns/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'data/repositories/hymns_repository.dart';
import 'models/favourites.dart';

// HymnsRepositoryImpl
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory documents = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(documents.path);
  Hive.registerAdapter(FavouriteHymnsAdapter());
  runApp(MultiRepositoryProvider(
    providers: [
      RepositoryProvider(
        create: (context) => HymnsRepositoryImpl(),
      ),
      BlocProvider(create: (context) => SearchHymnBloc(HymnsRepositoryImpl()))
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
            selectionHandleColor: Colors.pink.shade500),
      ),
      home: const SplashScreen(),
    ),
  ));
}
