import 'package:aafm_hymns/pages/home_page.dart';
import 'package:aafm_hymns/providers/hymn_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider(
      create: (BuildContext context) => HymnProvider(),
      child: MaterialApp(
          builder: (context, child) {
            return Directionality(
                textDirection: TextDirection.ltr, child: child!);
          },
          title: 'AAFM HYMNS',
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: Scaffold(
              appBar: AppBar(
                elevation: 10,
                title: const Text('AAFM HYMNS'),
              ),
              body: const HomePage())),
    ));
