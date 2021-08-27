import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/constants/apiConstants.dart';
import 'package:netflix_clone/controllers/movieDetailsController.dart';
import 'package:transparent_image/transparent_image.dart';

class CastListBuilder extends StatelessWidget {
  const CastListBuilder({
    Key? key,
    required this.size,
    required this.c,
  }) : super(key: key);

  final Size size;
  final MovieDetailsController c;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.builder(
        itemCount: c.credits!.cast!.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, i) {
          return GestureDetector(
            onTap: () {
              Get.bottomSheet(
                  Container(
                    height: size.height * 0.3,
                    //color: Colors.black,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: size.height * 0.2,
                            color: Colors.black,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: size.height * 0.06,
                                ),
                                Text(
                                  c.credits!.cast![i].name!,
                                  style: GoogleFonts.lato(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  'as',
                                  style: GoogleFonts.lato(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  c.credits!.cast![i].character!,
                                  style: GoogleFonts.lato(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: c.credits!.cast![i].profilePath != null
                              ? CircleAvatar(
                                  radius: 60,
                                  backgroundImage: NetworkImage(
                                      '${TMDB_BASE_IMAGE_URL}w500/${c.credits!.cast![i].profilePath}'),
                                )
                              : CircleAvatar(
                                  radius: 60,
                                  backgroundImage:
                                      AssetImage('assets/images/p.png'),
                                ),
                        ),
                      ],
                    ),
                  ),
                  enableDrag: false);
            },
            child: Container(
              child: Column(
                children: [
                  Container(
                    height: 110,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: AspectRatio(
                        aspectRatio: 2 / 2,
                        child: c.credits!.cast![i].profilePath != null
                            ? FadeInImage.memoryNetwork(
                                image:
                                    '${TMDB_BASE_IMAGE_URL}w500/${c.credits!.cast![i].profilePath}',
                                placeholder: kTransparentImage,
                                fit: BoxFit.cover,
                              )
                            : FadeInImage(
                                placeholder: AssetImage('assets/images/p.png'),
                                image: AssetImage('assets/images/p.png'),
                              ),
                      ),
                    ),
                  ),
                  Container(
                    width: 90,
                    margin: EdgeInsets.only(top: 16),
                    child: Text(
                      c.credits!.cast![i].name!,
                      style: GoogleFonts.lato(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                      overflow: TextOverflow.ellipsis,
                    ),
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
