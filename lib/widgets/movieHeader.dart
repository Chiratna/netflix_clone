import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/constants/apiConstants.dart';
import 'package:netflix_clone/constants/colorConstants.dart';
import 'package:netflix_clone/constants/pageId.dart';
import 'package:netflix_clone/controllers/movieDetailsController.dart';
import 'package:netflix_clone/models/GenreList.dart';
import 'package:netflix_clone/models/Movies.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MovieHeader extends StatelessWidget {
  const MovieHeader({
    Key? key,
    required this.size,
    required this.movie,
    required this.gList,
  }) : super(key: key);

  final Size size;
  final Movie movie;
  final List<Genres> gList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.5,
      child: Stack(
        children: [
          Container(
            height: size.height * 0.38,
          ),
          if (movie.backdropPath != null)
            Container(
              height: size.height * 0.38,
              child: Image.network(
                TMDB_BASE_IMAGE_URL + 'w500/' + movie.backdropPath!,
                fit: BoxFit.cover,
              ),
            ),
          if (movie.backdropPath == null)
            Container(
              height: size.height * 0.38,
              width: double.infinity,
              child: Image.network(
                TMDB_BASE_IMAGE_URL + 'w500/' + movie.posterPath!,
                fit: BoxFit.cover,
              ),
            ),
          Positioned(
            left: 0,
            right: 0,
            bottom: size.height * 0.07 + size.height * 0.05,
            child: Container(
              height: size.height * 0.2,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                    kBackgroundCOlor,
                    kBackgroundCOlor.withOpacity(0.5),
                    Colors.transparent
                  ])),
            ),
          ),
          Positioned(
            left: 32,
            bottom: size.height * 0.05,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kBackgroundCOlor,
              ),
              child: CircularPercentIndicator(
                radius: 80,
                backgroundColor: kBackgroundCOlor,
                percent: double.parse(movie.voteAverage!) / 10,
                center: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.favorite_rounded,
                      color: Colors.red,
                      size: 16,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(movie.voteAverage!,
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 20,
                        )),
                  ],
                ),
                circularStrokeCap: CircularStrokeCap.round,
                lineWidth: 8,
                animation: true,
                progressColor: Colors.red,
              ),
            ),
          ),
          Positioned(
            bottom: size.height * 0.06,
            right: 16,
            left: 128,
            child: Container(
              child: Text(
                movie.title!,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: movie.title!.length <= 10
                      ? 40
                      : movie.title!.length <= 20
                          ? 32
                          : 28,
                ),
              ),
            ),
          ),
          GetBuilder<MovieDetailsController>(
            builder: (c) {
              print(c.movie!.title! + 'cgggf');
              c.getMatchedGenres(m: movie, allGenres: gList);
              return Positioned(
                left: 120,
                right: 8,
                bottom: 0,
                child: Container(
                  // color: Colors.white,
                  height: 40,
                  // margin: EdgeInsets.only(top: 32),
                  child: ListView.builder(
                    itemCount: c.matchedGenres.length,
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (_, i) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(GenreMoviePageID, arguments: {
                            'genre': c.matchedGenres[i],
                            'gList': c.allGenres,
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                            //top: 32,
                            left: 8,
                            right: 8,
                          ),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Text(
                            c.matchedGenres[i].name!,
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
