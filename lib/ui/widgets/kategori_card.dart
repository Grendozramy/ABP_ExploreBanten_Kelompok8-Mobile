import 'package:explore_banten_mobile/ui/pages/category_page.dart';
import 'package:flutter/material.dart';
import '../../models/category_models.dart';
import '../../models/post_models.dart';
import '../../shared/theme.dart';

class KategoriCard extends StatelessWidget {
  final KategoriModel kategoris;

  KategoriCard(this.kategoris);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryPage(kategoris),
          ),
        );
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
          kategoris.name,
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: semibold,
          ),
        ),
      ),
    );
  }
}
