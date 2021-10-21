import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = const Duration(seconds: 5);

    return Timer(_duration, navigationPage);
  }

  @override
  void initState() {
    startTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/animations/intro.json'),
      ),
    );
  }

  void navigationPage() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Remember to turn focus mode on! Avoid disruptions 🙂'),
    ));
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomePage()));
  }
}
