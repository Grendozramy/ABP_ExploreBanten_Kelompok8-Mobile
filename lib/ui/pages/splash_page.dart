import 'dart:async';

import 'package:explore_banten_mobile/providers/category_providers.dart';
import 'package:explore_banten_mobile/providers/post_providers.dart';
import 'package:explore_banten_mobile/providers/slider_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../shared/theme.dart';

class SplashPage extends StatefulWidget {
  late String slug;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState

    getInit();

    super.initState();
  }

  getInit() async {
    await Provider.of<KategoriProvider>(context, listen: false).getKategori();
    await Provider.of<PlacesProvider>(context, listen: false).getPlace();
    await Provider.of<SliderProvider>(context, listen: false).getSlider();
    // await Provider.of<PlacesKategoriProvider>(context, listen: false)
    //     .getPlaceKategori(this.widget.slug);
    Navigator.pushNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 210,
              height: 138,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/img/splash.png',
                  ),
                ),
              ),
            ),
            Text(
              'WISATA BANTEN',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semibold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
