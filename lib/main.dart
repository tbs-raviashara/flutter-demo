import 'package:demo/camerademo.dart';
import 'package:demo/carousellist.dart';
import 'package:demo/deviceinfo.dart';
import 'package:demo/featurediscoverydemo.dart';
import 'package:demo/googlelogin.dart';
import 'package:demo/googlemapdemo.dart';
import 'package:demo/groupedlist.dart';
import 'package:demo/home.dart';
import 'package:demo/listview.dart';
import 'package:demo/literolling.dart';
import 'package:demo/newsApp.dart';
import 'package:demo/passdata.dart';
import 'package:demo/rating.dart';
import 'package:demo/second.dart';
import 'package:demo/storyview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(initialRoute: '/', routes: {
    '/': (context) => Home(),
    '/second': (context) => Second(),
    '/story': (context) => Story(),
    '/lite-roling': (context) => LiteRolling(),
    '/rating': (context) => Rating(),
    '/feature': (context) => FeatureDiscoveryDemo(),
    '/list': (context) => List(),
    '/group-list': (context) => GroupList(),
    '/google-login': (context) => GLogin(),
    '/pass-data': (context) => PassData(),
    '/device-info': (context) => DeviceInfo(),
    '/carouser-list': (context) => CarouserListDemo(),
    '/google-map': (context) => GoogleMapScreen(),
    '/news': (context) => NewsApp(),
    '/camera': (context) => CameraDemo(),
  }));
}
