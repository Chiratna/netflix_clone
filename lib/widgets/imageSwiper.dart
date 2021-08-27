import 'package:carousel_slider/carousel_slider.dart';
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
import 'package:transparent_image/transparent_image.dart';

class ImageSwiper extends StatelessWidget {
  const ImageSwiper({
    Key? key,
    required this.movies,
    required this.isFetching,
    required this.gList,
  }) : super(key: key);

  final List<Movie> movies;
  final bool isFetching;
  final List<Genres> gList;

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.white,
      child: CarouselSlider.builder(
        options: CarouselOptions(
          height: 300,
          enableInfiniteScroll: true,
          autoPlay: true,
          autoPlayCurve: Curves.easeIn,
          autoPlayAnimationDuration: Duration(milliseconds: 500),
          enlargeCenterPage: true,
          viewportFraction: 0.74,
          aspectRatio: 12 / 7,
        ),
        itemCount: isFetching ? 1 : movies.length,
        itemBuilder: (_, i, __) {
          String imageLink =
              isFetching ? '' : movies[i].backdropPath ?? movies[i].posterPath!;
          return GestureDetector(
            onTap: () {
              Get.toNamed(MovieDetailsPageId,
                  arguments: {'movie': movies[i], 'gList': gList});
            },
            child: Container(
                margin: EdgeInsets.only(bottom: 20, top: 20),
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
                              aspectRatio: 8 / 7,
                              // child: Image.network(
                              //   TMDB_BASE_IMAGE_URL + 'w500/' + imageLink,
                              //   fit: BoxFit.cover,
                              // ),
                              child: FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image: '${TMDB_BASE_IMAGE_URL}w500/$imageLink',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
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
                          Positioned(
                            bottom: 32,
                            left: 8,
                            right: 0,
                            child: Container(
                              margin: EdgeInsets.only(right: 64),
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
                          Positioned(
                            bottom: 24,
                            right: 16,
                            child: Text(
                              movies[i].voteAverage.toString(),
                              style: GoogleFonts.lato(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 24,
                            right: 50,
                            child: Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                          )
                        ],
                      )),
          );
        },
      ),
    );
  }
}
