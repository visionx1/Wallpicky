import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:wallpicky/screens/CategoriesWallpaperScreen/categoriesScreen.dart';

class Categories extends StatelessWidget {
  final String imageUrl;
  final String categoryName;

  Categories({this.categoryName, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoriesScreen(
              categoryName: categoryName,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 4.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: CachedNetworkImage(
                height: 60,
                width: 100,
                fit: BoxFit.cover,
                imageUrl: imageUrl,
              ),
            ),
            Container(
              height: 60,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(16.0)),
              alignment: Alignment.center,
              child: Text(
                categoryName,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
