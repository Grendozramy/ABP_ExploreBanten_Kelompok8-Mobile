import 'package:explore_banten_mobile/ui/pages/home_page.dart';
import 'package:explore_banten_mobile/ui/pages/maps_page.dart';
import 'package:explore_banten_mobile/ui/pages/places_all.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget customBottomNavigation() {
      return Container(
        width: double.infinity,
        height: 60,
        margin: EdgeInsets.only(bottom: 30, left: 24, right: 24),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: kWhiteColor,
            currentIndex: currentIndex,
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/img/home.png',
                  width: 24,
                  color: currentIndex == 0 ? kPrimaryColor : kGreyColor,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/img/tours.png',
                  width: 24,
                  color: currentIndex == 1 ? kPrimaryColor : kGreyColor,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/img/maps.png',
                  width: 24,
                  color: currentIndex == 2 ? kPrimaryColor : kGreyColor,
                ),
                label: '',
              ),
            ],
          ),
        ),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return HomePage();
          break;
        case 1:
          return PlacesPage();
          break;
        case 2:
          return MapsPage();
          break;

        default:
          return HomePage();
      }
    }

    return Scaffold(
      backgroundColor: kBGColor,
      bottomNavigationBar: customBottomNavigation(),
      body: body(),
    );
  }
}
