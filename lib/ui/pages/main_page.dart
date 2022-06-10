import 'package:explore_banten_mobile/ui/pages/home_page.dart';
import 'package:explore_banten_mobile/ui/widgets/custom_botomnavigation.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class MainPage extends StatefulWidget {
  int currentIndex = 0;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    Widget buildContent() {
      return HomePage();
    }

    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 74),
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: double.infinity,
            height: 60,
            margin: EdgeInsets.only(bottom: 30, left: 24, right: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/img/logo1.png',
                  width: 97,
                  height: 66,
                ),
                Image.asset(
                  'assets/img/search.png',
                  width: 40,
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget customBottomNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 60,
          margin: EdgeInsets.only(bottom: 30, left: 24, right: 24),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            CustomBotomNavigation(
              imageUrl: 'assets/img/homea.png',
              isSelected: true,
            ),
            CustomBotomNavigation(
              imageUrl: 'assets/img/tours.png',
            ),
            CustomBotomNavigation(
              imageUrl: 'assets/img/maps.png',
            ),
            CustomBotomNavigation(
              imageUrl: 'assets/img/other.png',
            ),
          ]),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBGColor,
      body: Stack(
        children: [
          buildContent(),
          header(),
          customBottomNavigation(),
        ],
      ),
    );
  }
}
