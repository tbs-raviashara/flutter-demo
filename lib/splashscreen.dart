import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    color: Colors.white30,
    home: SplashApp(),
  ));
}

class SplashApp extends StatefulWidget {
  SplashApp({Key key}) : super(key: key);

  @override
  _SplashAppState createState() => _SplashAppState();
}

class _SplashAppState extends State<SplashApp> {
  BuildContext staticContext;
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    Timer(Duration(seconds: 2), nextScreen);
  }

  @override
  Widget build(BuildContext context) {
    staticContext = context;
    return Scaffold(
      body: Center(child: Image.asset('assets/images/logo.png')),
    );
  }

  void nextScreen() {
    Navigator.pushReplacementNamed(staticContext, '/home');
  }
}
