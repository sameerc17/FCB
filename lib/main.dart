import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'home.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 3,
        navigateAfterSeconds: Home(),
        title: Text(
          'FC Barcelona App',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30.0, color: Colors.white),
        ),
        image: Image.asset(
          'images/fcb2.png',
        ),
        gradientBackground: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xff91000f),
            Color(0xff1d2671),
          ],
        ),
        loadingText: Text(
          'Loading app ...',
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
        photoSize: 60.0,
        loaderColor: Colors.blue.shade300);
  }
}

