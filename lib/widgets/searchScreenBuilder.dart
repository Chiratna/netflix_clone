import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/constants/apiConstants.dart';
import 'package:netflix_clone/constants/colorConstants.dart';
import 'package:netflix_clone/constants/pageId.dart';
import 'package:netflix_clone/controllers/SearchController.dart';
import 'package:netflix_clone/controllers/homeController.dart';
import 'package:netflix_clone/widgets/searchList.dart';
import 'package:transparent_image/transparent_image.dart';

class SearchScreenBuilder extends StatelessWidget {
  const SearchScreenBuilder({
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
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 64,
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(8),
              ),
              height: kToolbarHeight,
              child: GetBuilder<SearchController>(builder: (c) {
                return Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: c.tC,
                        cursorColor: Colors.white,
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Search Your Favourite Movie',
                          hintStyle: GoogleFonts.lato(
                            color: Colors.white60,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                        onSubmitted: (String str) {
                          c.searchMovie(str.trim());
                        },
                      ),
                    ),
                    GestureDetector(
                      child: Icon(
                        Icons.cancel_outlined,
                        color: Colors.white,
                      ),
                      onTap: () {
                        c.clearSearch();
                      },
                    )
                  ],
                );
              })),
          GetBuilder<SearchController>(builder: (c) {
            if (!c.hasSearched)
              return Expanded(
                child: Center(
                  child: Text(
                    'Search',
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            else if (c.hasSearched && c.isSearching)
              return Expanded(
                child: Center(
                  child: SpinKitWave(
                    color: Colors.grey,
                  ),
                ),
              );
            else {
              if (c.resultMovie.isEmpty) {
                return Expanded(
                  child: Center(
                    child: Text(
                      'Oops, could not find your movie...',
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ),
                );
              } else {
                return Expanded(
                  child: SearchList(
                    controller: controller,
                    c: c,
                  ),
                );
              }
            }
          }),
        ],
      ),
    );
  }
}
