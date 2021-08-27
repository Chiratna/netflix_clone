import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/constants/apiConstants.dart';
import 'package:netflix_clone/constants/colorConstants.dart';
import 'package:netflix_clone/constants/pageId.dart';
import 'package:netflix_clone/controllers/homeController.dart';
import 'package:netflix_clone/models/GenreList.dart';
import 'package:netflix_clone/models/Movies.dart';
import 'package:netflix_clone/screens/MovieDetails.dart';

class ImageList extends StatelessWidget {
  const ImageList({
    Key? key,
    required this.movies,
    required this.isFetching,
    required this.isPoster,
    required this.gList,
  }) : super(key: key);

  // final HomeController controller;
  final List<Movie> movies;
  final bool isFetching;
  final bool isPoster;
  final List<Genres> gList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: movies.length,
      itemBuilder: (_, i) {
        String imageLink = isPoster
            ? movies[i].posterPath!
            : movies[i].backdropPath ?? movies[i].posterPath!;
        return GestureDetector(
          onTap: () {
            Get.toNamed(MovieDetailsPageId,
                arguments: {'movie': movies[i], 'gList': gList});
            //Get.toNamed(TestId, arguments: {'movie': 1234, 'gList': 7890});
          },
          child: Container(
              margin: EdgeInsets.only(
                  bottom: 20,
                  top: 20,
                  right: isPoster ? 0 : 10,
                  left: isPoster ? 0 : 10),
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: kBackgroundCOlor,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff1d2023),
                    blurRadius: 16,
                    offset: Offset(-8, -8),
                  ),
                  BoxShadow(
                    color: Color(0xff1d2023),
                    blurRadius: 16,
                    offset: Offset(8, 8),
                  )
                ],
              ),
              child: isFetching
                  ? Center(
                      child: SpinKitWave(
                        color: Colors.grey[400],
                      ),
                    )
                  : Stack(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: AspectRatio(
                                aspectRatio: isPoster ? 2 / 3 : 3.5 / 2,
                                child: FadeInImage(
                                  image: NetworkImage(TMDB_BASE_IMAGE_URL +
                                      'w500/' +
                                      imageLink),
                                  placeholder:
                                      AssetImage('assets/images/ld.gif'),
                                ))),
                        if (!isPoster)
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(24),
                                  bottomRight: Radius.circular(24),
                                ),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.grey[900]!,
                                    Colors.transparent,
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                            ),
                          ),
                        if (!isPoster)
                          Positioned(
                            bottom: 32,
                            left: 8,
                            right: 0,
                            child: Container(
                              margin: EdgeInsets.only(right: 32),
                              child: Text(
                                movies[i].title!,
                                style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                      ],
                    )),
        );
      },
    );
  }
}
