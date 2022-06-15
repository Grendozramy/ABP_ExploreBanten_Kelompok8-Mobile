import 'package:explore_banten_mobile/models/kategori.dart';
import 'package:explore_banten_mobile/models/post.dart';
import 'package:explore_banten_mobile/ui/widgets/post_tile.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../widgets/kategori_card.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List images = [
    'assets/img/slider1.png',
    'assets/img/slider2.jpg',
    'assets/img/slider3.jpg',
  ];

  List titles = [
    'WISATA BANTEN',
    'KENIKMATAN KULINER KHAS BANTEN',
    'BANTEN PENUH AKAN BUDAYA',
  ];

  List desc = [
    'Nikmati dan Jelajahi \n Layaknya Petualang',
    'Yuk! Cicipi Kuliner \n Khas Banten',
    'Mari Lestarikan Kebudayaan \n yang ada di Banten',
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget indicator(int index) {
      return Container(
        width: currentIndex == index ? 16 : 4,
        height: 4,
        margin: EdgeInsets.only(top: 25, left: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currentIndex == index ? kPrimaryColor : Color(0xffC4C4C4),
        ),
      );
    }

    Widget backgroundImage() {
      int index = -1;
      return Container(
        child: Stack(
          children: [
            Container(
              child: CarouselSlider(
                items: images
                    .map(
                      (item) => Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(item.toString()),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                              kBlackColor.withOpacity(0.37),
                              BlendMode.srcOver,
                            ),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 100),
                              child: Text(
                                '${titles[currentIndex]}',
                                style: whiteTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: light,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${desc[currentIndex]}',
                                style: whiteTextStyle.copyWith(
                                  fontSize: 20,
                                  fontWeight: medium,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
                options: CarouselOptions(
                    height: 299.3,
                    autoPlay: true,
                    viewportFraction: 1,
                    autoPlayInterval: const Duration(seconds: 12),
                    initialPage: 0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    }),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 250),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: images.map((e) {
                  index++;
                  return indicator(index);
                }).toList(),
              ),
            ),
          ],
        ),
      );
    }

    Widget KategoryTitle() {
      return Container(
        child: Container(
          margin: EdgeInsets.only(
            top: 31,
            left: 30,
            right: 30,
          ),
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: kPrimaryColor,
                width: 3.0,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text(
              'Kategori',
              style: blackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semibold,
              ),
            ),
          ),
        ),
      );
    }

    Widget Category() {
      return Container(
        margin: EdgeInsets.only(
          top: 13,
          left: 12,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: 24,
              ),
              Row(
                children: [
                  KategoriCard(
                    Kategori(id: 01, name: 'Alam'),
                  ),
                  KategoriCard(
                    Kategori(id: 02, name: 'Budaya'),
                  ),
                  KategoriCard(
                    Kategori(id: 03, name: 'Kuliner'),
                  ),
                  KategoriCard(
                    Kategori(id: 04, name: 'Farhan Gimang'),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget TerbaruTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: 46,
          left: 30,
          right: 30,
        ),
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: kPrimaryColor,
              width: 3.0,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Text(
            'Terbaru',
            style: blackTextStyle.copyWith(
              fontSize: 18,
              fontWeight: semibold,
            ),
          ),
        ),
      );
    }

    Widget Terbaru() {
      return Container(
        margin: EdgeInsets.only(
          top: 10,
          bottom: 90,
        ),
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
            PostTile(
              Post(
                  id: 03,
                  name: 'Suku Baduy',
                  imageUrl: 'assets/img/baduy.jpg',
                  address: 'Baduy, Banten'),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 82,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Container(
          margin: EdgeInsets.only(top: 74),
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: double.infinity,
              height: 60,
              margin: EdgeInsets.only(bottom: 50, left: 24, right: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/img/logo1.png',
                    width: 97,
                    height: 66,
                  ),
                  GestureDetector(
                    onTap: () {
                      showSearch(
                        context: context,
                        delegate: CustomSearch(),
                      );
                    },
                    child: Image.asset(
                      'assets/img/search.png',
                      width: 40,
                      height: 40,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          backgroundImage(),
          KategoryTitle(),
          Category(),
          TerbaruTitle(),
          Terbaru()
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
