import 'package:explore_banten_mobile/models/category_models.dart';
import 'package:explore_banten_mobile/models/post_models.dart';
import 'package:explore_banten_mobile/providers/post_providers.dart';
import 'package:explore_banten_mobile/ui/widgets/post_tile.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';

int selectedindex = 0;

class CategoryPage extends StatelessWidget {
  final KategoriModel kategoris;
  // ignore: use_key_in_widget_constructors
  const CategoryPage(this.kategoris);

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
                  kategoris.name,
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
                .where((element) =>
                    element.category.name.contains((selectedindex == 0)
                        ? 'Alam'
                        : (selectedindex == 1)
                            ? 'Budaya'
                            : 'Kuliner'))
                .toList()
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
