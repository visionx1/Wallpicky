import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpicky/Models/data/data.dart';
import 'package:wallpicky/Models/wallpaperModel.dart';
import 'package:wallpicky/screens/Home/components/widget.dart';

class CategoriesScreen extends StatefulWidget {
  final String categoryName;
  CategoriesScreen({this.categoryName});
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<WallpaperModel> wallpapers = new List();

  getCategoryWallpaper(String category) async {
    await http.get(
        "https://api.pexels.com/v1/search?query=$category&per_page=30&page=1",
        headers: {"Authorization": apiKey}).then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      jsonData["photos"].forEach((element) {
        WallpaperModel wallpaperModel = new WallpaperModel();
        wallpaperModel = WallpaperModel.fromMap(element);
        wallpapers.add(wallpaperModel);
      });

      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    getCategoryWallpaper(widget.categoryName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: brandName(),
        elevation: 0.0,
        actions: <Widget>[
          Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ))
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 30,
              ),
              wallpapersList(
                context: context,
                wallpapers: wallpapers,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
