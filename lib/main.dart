import 'package:explore_banten_mobile/providers/category_providers.dart';
import 'package:explore_banten_mobile/providers/post_providers.dart';
import 'package:explore_banten_mobile/providers/slider_provider.dart';
import 'package:explore_banten_mobile/ui/pages/category_page.dart';
import 'package:explore_banten_mobile/ui/pages/main_page.dart';
import 'package:explore_banten_mobile/ui/pages/maps_page.dart';
import 'package:explore_banten_mobile/ui/pages/places_all.dart';

import 'package:explore_banten_mobile/ui/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PlacesProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => KategoriProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SliderProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/home': (context) => MainPage(),
          '/tours': (context) => PlacesPage(),
          '/maps': (context) => MapsPage(),
          // '/rute': (context) => RutePage(),
        },
      ),
    );
  }
}
