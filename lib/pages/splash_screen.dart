import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var duration = const Duration(seconds: 3);

    return Timer(duration, navigationPage);
  }

  @override
  void initState() {
    startTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.jpg'),
            const SizedBox(height: 50),
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'AAFM Hymns',
                  speed: const Duration(milliseconds: 90),
                  textStyle: const TextStyle(
                      fontFamily: 'Fruktur', fontSize: 50, color: Colors.green),
                )
              ],
              // waveDuration: const Duration(seconds: 5),
              // boxBackgroundColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }

  void navigationPage() {
    // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //   content: Text('Remember to turn focus mode on! Avoid disruptions 🙂'),
    // ));
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomePage()));
  }
}
