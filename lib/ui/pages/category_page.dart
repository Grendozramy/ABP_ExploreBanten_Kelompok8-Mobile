import 'package:flutter/material.dart';
import '../../models/post.dart';
import '../../shared/theme.dart';
import '../../models/kategori.dart';
import '../widgets/post_tile.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: kBGColor,
        title: Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: kPrimaryColor,
                width: 3.0,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Alam',
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semibold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showSearch(
                      context: context,
                      delegate: CustomSearch(),
                    );
                  },
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/img/seach1.png',
                        ),
                      ),
                    ),
                  ),
                )
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
            children: [
              PostTile(
                Post(
                    id: 01,
                    name: 'Tanjung Lesung',
                    imageUrl: 'assets/img/TanjungLesung.jpg',
                    address: 'Tanjung Lesung, Banten'),
              ),
              PostTile(
                Post(
                    id: 02,
                    name: 'Gunung Luhur',
                    imageUrl: 'assets/img/gluhur.jpg',
                    address: 'Citorek Kidul, Kec Cibeber'),
              ),
            ],
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

class CustomSearch extends SearchDelegate {
  List<String> searchTerms = [
    'alam',
    'budaya',
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in searchTerms) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in searchTerms) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }
}
