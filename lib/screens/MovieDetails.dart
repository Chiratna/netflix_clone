import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/constants/apiConstants.dart';
import 'package:netflix_clone/constants/colorConstants.dart';
import 'package:netflix_clone/controllers/movieDetailsController.dart';
import 'package:netflix_clone/models/GenreList.dart';
import 'package:netflix_clone/models/Movies.dart';
import 'package:netflix_clone/widgets/castList.dart';
import 'package:netflix_clone/widgets/movieHeader.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:transparent_image/transparent_image.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MovieDetailsController mC = Get.find<MovieDetailsController>();
    if (mC.movie == null || Get.arguments['movie'] != null) {
      print(Get.arguments['movie'].title);
      mC.setMovie(Get.arguments['movie']);
    }
    if (mC.allGenres.isEmpty || Get.arguments['gList'] != null) {
      mC.setAllGenres(Get.arguments['gList']);
    }

    Size size = MediaQuery.of(context).size;
    Get.find<MovieDetailsController>().getCredits(mC.movie!.id!);
    return Scaffold(
      backgroundColor: kBackgroundCOlor,
      body: Container(
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MovieHeader(size: size, movie: mC.movie!, gList: mC.allGenres),
              Container(
                margin: EdgeInsets.only(
                  left: 16,
                  top: 32,
                ),
                child: Text(
                  'Overview',
                  style: GoogleFonts.lato(
                    color: Colors.red,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 16,
                  left: 16,
                ),
                child: Text(
                  mC.movie!.overview!,
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 16,
                  top: 16,
                ),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Release Date :  ',
                        style: GoogleFonts.lato(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                          text: mC.movie!.releaseDate,
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ))
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 16, top: 32, bottom: 16),
                child: Text(
                  'Cast',
                  style: GoogleFonts.lato(
                    color: Colors.red,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GetBuilder<MovieDetailsController>(
                builder: (c) {
                  return c.isFetchingCredits
                      ? Container(
                          child: SpinKitPulse(
                            color: Colors.grey,
                          ),
                        )
                      : CastListBuilder(size: size, c: c);
                },
              ),
              SizedBox(
                height: 24,
              )
            ],
          ),
        ),
      ),
    );
  }
}
