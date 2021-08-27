import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/bindings/AllBindings.dart';
import 'package:netflix_clone/bindings/GenreMovieBinding.dart';
import 'package:netflix_clone/bindings/HomePageBinding.dart';
import 'package:netflix_clone/bindings/MovieDetailPageBinding.dart';
import 'package:netflix_clone/bindings/SearchPageBinding.dart';
import 'package:netflix_clone/constants/pageId.dart';
import 'package:netflix_clone/screens/GenreMovieScreen.dart';
import 'package:netflix_clone/screens/Home.dart';
import 'package:netflix_clone/screens/MovieDetails.dart';
import 'package:netflix_clone/screens/Test.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: HomePageId,
      //title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(
          name: HomePageId,
          page: () => Home(),
          bindings: [HomePageBinding(), SearchPageBinding()],
        ),
        GetPage(
          name: MovieDetailsPageId,
          page: () => MovieDetails(),
          binding: MovieDetailsPageBinding(),
        ),
        GetPage(
            name: GenreMoviePageID,
            page: () => GenreMovieScreen(),
            binding: GenreMovieBinding()),
      ],
    );
  }
}
