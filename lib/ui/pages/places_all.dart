import 'package:explore_banten_mobile/providers/category_providers.dart';
import 'package:flutter/material.dart';
import '../../providers/post_providers.dart';
import '../../shared/theme.dart';
import '../widgets/post_tile.dart';
import 'package:provider/provider.dart';

class PlacesPage extends StatelessWidget {
  const PlacesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PlacesProvider placesProvider = Provider.of<PlacesProvider>(context);

    Widget header() {
      return AppBar(
        backgroundColor: kBGColor,
        title: Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: kPrimaryColor,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'Semua Wisata',
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semibold,
                  ),
                ),
              ],
            ),
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget places() {
      return Container(
        margin: EdgeInsets.only(
          top: 140,
          bottom: 10,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: PlacesProvider.places
                .map(
                  (places) => PostTile(places),
                )
                .toList(),
          ),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          header(),
          places(),
        ],
      ),
    );
  }
}
