import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/constants/apiConstants.dart';
import 'package:netflix_clone/constants/colorConstants.dart';
import 'package:netflix_clone/constants/pageId.dart';
import 'package:netflix_clone/controllers/SearchController.dart';
import 'package:netflix_clone/controllers/homeController.dart';
import 'package:netflix_clone/models/Movies.dart';
import 'package:transparent_image/transparent_image.dart';

class SearchList extends StatelessWidget {
  const SearchList({
    Key? key,
    required this.controller,
    required this.c,
  }) : super(key: key);

  final HomeController controller;
  final SearchController c;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: c.resultMovie.length + 1,
        itemBuilder: (_, i) {
          if (i == c.resultMovie.length)
            return Container(
              height: kToolbarHeight + 24,
            );
          return GestureDetector(
            onTap: () {
              Get.toNamed(MovieDetailsPageId, arguments: {
                'movie': c.resultMovie[i],
                'gList': controller.isFetchingGenres ? [] : controller.genreList
              });

              //controller.toggleHomeScreenState(true);
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
                          backgroundImage: AssetImage('assets/images/nf.png'),
                        ),
                      if (c.resultMovie[i].posterPath != null)
                        Container(
                            height: 90,
                            width: 80,
                            child: FadeInImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  '${TMDB_BASE_IMAGE_URL}w500/${c.resultMovie[i].posterPath}'),
                              placeholder: AssetImage('assets/images/ld.gif'),
                            )),
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
    );
  }
}
