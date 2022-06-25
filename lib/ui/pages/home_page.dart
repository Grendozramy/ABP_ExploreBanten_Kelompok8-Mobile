import 'package:explore_banten_mobile/models/category_models.dart';
import 'package:explore_banten_mobile/models/sliders_model.dart';
import 'package:explore_banten_mobile/providers/category_providers.dart';
import 'package:explore_banten_mobile/providers/post_providers.dart';
import 'package:explore_banten_mobile/ui/widgets/post_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/slider_provider.dart';
import '../../shared/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../widgets/kategori_card.dart';

class HomePage extends StatefulWidget {
  // final SliderModel slider;
  // HomePage(this.slider);

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

  Future<void> updateData() async {
    await Provider.of<KategoriProvider>(context, listen: false).getKategori();
    await Provider.of<PlacesProvider>(context, listen: false).getPlace();
    await Provider.of<SliderProvider>(context, listen: false).getSlider();
    setState(() {});
  }

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
                children: KategoriProvider.kategoris
                    .map(
                      (kategoris) => KategoriCard(kategoris),
                    )
                    .toList(),
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
          children: PlacesProvider.places
              .map(
                (places) => PostTile(places),
              )
              .toList(),
        ),
      );
    }

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(Duration(milliseconds: 400));
          updateData();
        },
        child: ListView(
          children: [
            backgroundImage(),
            KategoryTitle(),
            Category(),
            TerbaruTitle(),
            Terbaru()
          ],
        ),
      ),
    );
  }
}
