import 'package:explore_banten_mobile/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class Header extends StatefulWidget {
  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
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

    return Scaffold(
      backgroundColor: kBGColor,
      body: Stack(
        children: [
          buildContent(),
          header(),
        ],
      ),
    );
  }
}
