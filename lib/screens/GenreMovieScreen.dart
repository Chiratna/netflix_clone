import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/constants/apiConstants.dart';
import 'package:netflix_clone/constants/colorConstants.dart';
import 'package:netflix_clone/constants/pageId.dart';
import 'package:netflix_clone/controllers/GenreMovieControllers.dart';
import 'package:netflix_clone/models/GenreList.dart';
import 'package:netflix_clone/screens/Test.dart';
import 'package:transparent_image/transparent_image.dart';

class GenreMovieScreen extends StatelessWidget {
  const GenreMovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundCOlor,
      body: GetBuilder<GenreMovieController>(builder: (c) {
        if (c.genre == null) c.setGenre(Get.arguments['genre']);
        if (c.allGenres.isEmpty) {
          c.setAllGenres(Get.arguments['gList']);
        }
        c.fetchGenreMovies();
        if (c.isFetchingMovies)
          return Center(
            child: SpinKitWave(
              color: Colors.grey,
            ),
          );
        else
          return Container(
            margin: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: kToolbarHeight,
                  margin: EdgeInsets.only(top: 32, left: 16),
                  child: Text(
                    c.genre!.name!,
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: c.resultMovie.length,
                    itemBuilder: (_, i) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(
                            MovieDetailsPageId,
                            arguments: {
                              'movie': c.resultMovie[i],
                              'gList': c.allGenres
                            },
                            preventDuplicates: false,
                            // id: 1,
                          );

                          // Get.to(() => HomeScreen());
                        },
                        child: Container(
                          color: kBackgroundCOlor,
                          padding: EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (c.resultMovie[i].posterPath == null)
                                    CircleAvatar(
                                      radius: 80,
                                      backgroundImage:
                                          AssetImage('assets/images/nf.png'),
                                    ),
                                  if (c.resultMovie[i].posterPath != null)
                                    Container(
                                      height: 90,
                                      width: 80,
                                      child: FadeInImage.memoryNetwork(
                                        placeholder: kTransparentImage,
                                        image:
                                            '${TMDB_BASE_IMAGE_URL}w500/${c.resultMovie[i].posterPath}',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                    child: Text(c.resultMovie[i].title!,
                                        style: GoogleFonts.lato(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  )
                                ],
                              ),
                              Divider(
                                color: Colors.white,
                                thickness: 1,
                                height: 10,
                                indent: 8,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
      }),
    );
  }
}
