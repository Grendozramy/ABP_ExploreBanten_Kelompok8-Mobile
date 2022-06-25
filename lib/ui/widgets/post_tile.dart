import 'package:explore_banten_mobile/ui/pages/post_page.dart';

import 'package:flutter/material.dart';
import '../../models/post_models.dart';
import '../../shared/theme.dart';

class PostTile extends StatelessWidget {
  final PlacesModel places;

  PostTile(this.places);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PostPage1(places),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          left: 40,
          right: 24,
          bottom: 24,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                // places.images[0].image,
                'https://cdn.pixabay.com/photo/2016/11/29/03/28/eagle-1867067_960_720.jpg',
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    places.title1,
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    places.address1,
                    style: greyTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: light,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
