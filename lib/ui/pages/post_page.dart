import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:explore_banten_mobile/models/category_models.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:explore_banten_mobile/models/post_models.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:url_launcher/url_launcher.dart';

class PostPage1 extends StatelessWidget {
  final PlacesModel places;

  PostPage1(this.places);

  Future<void> share() async {
    await FlutterShare.share(
        title: 'Share Wisata ' + places.title,
        text: places.title,
        linkUrl: 'http://explorebanten/blogs/' + places.slug,
        chooserTitle: places.title1);
  }

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Container(
        child: Stack(
          children: [
            Image.network(
              //places.images[0].image,
              'https://cdn.pixabay.com/photo/2016/11/29/03/28/eagle-1867067_960_720.jpg',
              width: MediaQuery.of(context).size.width,
              height: 324,
              fit: BoxFit.cover,
            )
          ],
        ),
      );
    }

    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 214),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(
                  width: 350,
                  child: AutoSizeText(
                    places.title,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: whiteTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: semibold,
                      shadows: [
                        Shadow(
                            color: Colors.black.withOpacity(0.3),
                            offset: const Offset(5, 5),
                            blurRadius: 15),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 281),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(15),
          ),
          color: kWhiteColor,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Deskripsi
                    Text(
                      'Deskripsi',
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semibold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    HtmlWidget(
                      ' <p align="justify"' + places.description + '</p>',
                      textStyle: blackTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: reguler,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Info Wisata',
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semibold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Alamat',
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semibold,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      places.address,
                      style: blackTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: reguler,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Jam Operasi',
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semibold,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      places.office_hours,
                      style: blackTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: reguler,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Telepon',
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semibold,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      places.phone,
                      style: blackTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: reguler,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Website',
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semibold,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    InkWell(
                      child: Text(
                        places.website,
                        style: primaryTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: reguler,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      onTap: () {
                        if (places.website == '-') {
                          print('');
                        } else {
                          launch(places.website);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () => MapsLauncher.launchCoordinates(
                places.latitude, places.longitude, places.title1),
            icon: const Icon(
              Icons.place,
            ),
          ),
          IconButton(
            onPressed: share,
            icon: const Icon(
              Icons.share,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          backgroundImage(),
          title(),
          content(),
        ],
      ),
    );
  }
}
