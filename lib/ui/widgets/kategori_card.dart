import 'package:flutter/material.dart';
import '../../models/kategori.dart';
import '../../shared/theme.dart';

class KategoriCard extends StatelessWidget {
  final Kategori kategori;

  KategoriCard(this.kategori);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/tour');
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 23,
          vertical: 3,
        ),
        margin: EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: kPrimaryColor,
            width: 1,
          ),
        ),
        child: Text(
          kategori.name,
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: semibold,
          ),
        ),
      ),
    );
  }
}
