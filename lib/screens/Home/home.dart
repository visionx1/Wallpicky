import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpicky/Models/categoriesModel.dart';
import 'package:wallpicky/Models/data/data.dart';
import 'package:wallpicky/Models/wallpaperModel.dart';
import 'package:wallpicky/screens/Home/components/categories.dart';
import 'package:wallpicky/screens/Home/components/widget.dart';
import 'package:http/http.dart' as http;
import 'package:wallpicky/screens/SearchScreen/searchScreen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = new List();
  List<WallpaperModel> wallpapers = new List();
  final TextEditingController _searchController = TextEditingController();

  getTrendingWallpapers() async {
    var response = await http
        .get("https://api.pexels.com/v1/curated?per_page=200", headers: {
      "Authorization": apiKey,
    });
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData['photos'].forEach((element) {
      WallpaperModel wallpaperModel = new WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });

    setState(() {});
  }

  @override
  void initState() {
    categories = getCategories();
    super.initState();
    getTrendingWallpapers();
  }

  @override
  Widget build(BuildContext context) {
    print(
        "********************* Widget is Rebuilding *******************************");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: brandName(),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24.0),
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  color: Color(0xfff5f8fd),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: "Search wallpapers",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (_searchController.text != "") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchView(
                                search: _searchController.text,
                              ),
                            ),
                          );
                        }
                      },
                      child: Container(
                        child: Icon(Icons.search),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Column(
                children: [
                  Container(
                    height: 80,
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return Categories(
                          categoryName: categories[index].categoriesName,
                          imageUrl: categories[index].imageUrl,
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  wallpapersList(
                    context: context,
                    wallpapers: wallpapers,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
