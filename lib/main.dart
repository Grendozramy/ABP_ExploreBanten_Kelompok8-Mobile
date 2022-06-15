import 'package:explore_banten_mobile/models/kategori.dart';
import 'package:explore_banten_mobile/ui/pages/category_page.dart';
import 'package:explore_banten_mobile/ui/pages/main_page.dart';
import 'package:explore_banten_mobile/ui/pages/maps_page.dart';
import 'package:explore_banten_mobile/ui/pages/places_all.dart';
import 'package:explore_banten_mobile/ui/pages/post_page.dart';
import 'package:explore_banten_mobile/ui/pages/rute_page.dart';
import 'package:explore_banten_mobile/ui/pages/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashPage(),
        '/home': (context) => MainPage(),
        '/tours': (context) => PlacesPage(),
        '/maps': (context) => MapsPage(),
        '/rute': (context) => RutePage(),
        '/tour': (context) => CategoryPage(),
        '/post': (context) => PostPage(),
      },
    );
  }
}
