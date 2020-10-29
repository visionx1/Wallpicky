import 'package:flutter/material.dart';
import 'package:wallpicky/screens/Home/home.dart';
import 'package:wallpicky/screens/SearchScreen/searchScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wallpicky',
      theme: ThemeData(
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
      routes: {
        SearchView.routeName: (context) => SearchView(search: null),
      },
    );
  }
}
