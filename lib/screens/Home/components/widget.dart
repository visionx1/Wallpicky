import 'package:flutter/material.dart';
import 'package:wallpicky/Models/wallpaperModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wallpicky/screens/SingleImageview/singleImageview.dart';

Widget brandName() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        'Wall',
        style: const TextStyle(color: Colors.black87),
      ),
      const Text(
        'Picky',
        style: const TextStyle(color: Colors.purple),
      )
    ],
  );
}

Widget wallpapersList({context, List<WallpaperModel> wallpapers}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    child: StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: wallpapers.length,
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Material(
          elevation: 0.0,
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          child: InkWell(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SingleImageView(
                      imageUrl: wallpapers[index].src.portrait,
                    ),
                  ),
                );
              },
              child: Hero(
                tag: wallpapers[index].src.portrait,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  child: FadeInImage(
                    image: CachedNetworkImageProvider(
                      wallpapers[index].src.portrait,
                    ),
                    fit: BoxFit.cover,
                    placeholder: AssetImage(
                      "assets/gif/loading.gif",
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
    ),
  );
}
