import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import '../../shared/theme.dart';
import 'package:flutter_share/flutter_share.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);

  Future<void> share() async {
    await FlutterShare.share(
        title: 'Example share',
        text: 'Example share text',
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Example Chooser Title');
  }

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Container(
        child: Stack(
          children: [
            Image.asset(
              'assets/img/gluhur.jpg',
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
            Expanded(
              child: Column(
                children: [
                  Text(
                    'Gunung Luhur, Negeri di Atas Awan',
                    softWrap: false,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: whiteTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: semibold,
                    ),
                  )
                ],
              ),
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
                    Text(
                      'Keindahan negeri di atas awan Citorek tak kalah mempesona dibandingkan panorama serupa yang bisa disaksikan di negeri di atas awan yang berada disejumlah daerah. Setelah keberadaan negeri di atas awan Gunung Luhur menjadi viral, banyak pengunjung yang datang setiap harinya. Jumlah pengunjung akan meningkat pesat saat akhir pekan, meskipun sebagian besar pengunjung itu berasal dari Lebak, dan masih sebagian kecil pengunjung dari luar daerah.\nJika pengunjung baru tiba di lokasi lebih dari pukul 08.00 WIB, awan mulai beranjak pergi dan hanya menyuguhkan pemandangan lembah Citorek dari ketinggian saja. Karena itu, menginap adalah salah satu pilihan terbaik supaya tidak ketinggalan momen samudera awan. Tapi jangan bayangkan hotel yang nyaman, karena memang belum tersedia.',
                      style: blackTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: reguler,
                      ),
                      textAlign: TextAlign.justify,
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
                      'Citorek Kidul, Kec. Cibeber, Kabupaten Lebak, Banten',
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
                      '07.00 - 18.00 WIB',
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
                      '0812345671',
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
                    Text(
                      'gunungluhurcitorek.co.id',
                      style: blackTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: reguler,
                      ),
                      textAlign: TextAlign.justify,
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
            onPressed: () {
              Navigator.pushNamed(context, '/rute');
            },
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
