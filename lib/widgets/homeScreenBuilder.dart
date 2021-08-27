import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/constants/colorConstants.dart';
import 'package:netflix_clone/controllers/homeController.dart';

import 'imageList.dart';
import 'imageSwiper.dart';

class HomeScreenBuilder extends StatelessWidget {
  const HomeScreenBuilder({
    Key? key,
    required this.size,
    required this.controller,
  }) : super(key: key);

  final Size size;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 32),
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: 'Cine',
                      style: GoogleFonts.lato(
                        color: Colors.red,
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                      )),
                  TextSpan(
                      text: 'Hall',
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ))
                ]),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(
                left: 16,
                top: 16,
              ),
              child: Text(
                'Now Playing',
                style: GoogleFonts.lato(
                  color: kTextColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GetBuilder<HomeController>(builder: (c) {
              return ImageSwiper(
                movies: controller.nowPlayingMovieList,
                isFetching: controller.isFetchingNowPlayingMovies,
                gList: controller.isFetchingGenres ? [] : controller.genreList,
              );
            }),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Text(
                'Discover',
                style: GoogleFonts.lato(
                  color: kTextColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GetBuilder<HomeController>(builder: (c) {
              return Container(
                height: 250,
                child: ImageList(
                  isPoster: true,
                  movies: controller.discoverMovieList,
                  isFetching: controller.isFetchingDiscoverMovies,
                  gList:
                      controller.isFetchingGenres ? [] : controller.genreList,
                ),
              );
            }),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Text(
                'Popular',
                style: GoogleFonts.lato(
                  color: kTextColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GetBuilder<HomeController>(builder: (c) {
              return Container(
                height: 200,
                child: ImageList(
                  isPoster: false,
                  movies: controller.popularMoviesList,
                  isFetching: controller.isFetchingPopularMovies,
                  gList:
                      controller.isFetchingGenres ? [] : controller.genreList,
                ),
              );
            }),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Text(
                'Top Rated',
                style: GoogleFonts.lato(
                  color: kTextColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GetBuilder<HomeController>(builder: (c) {
              return Container(
                height: 250,
                child: ImageList(
                  isPoster: true,
                  movies: controller.topRatedMovieList,
                  isFetching: controller.isFetchingTopRatedMovie,
                  gList:
                      controller.isFetchingGenres ? [] : controller.genreList,
                ),
              );
            }),
            SizedBox(
              height: kToolbarHeight + 24,
            )
          ],
        ),
      ),
    );
  }
}
