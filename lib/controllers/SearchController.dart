import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/api/apiEndpoints.dart';
import 'package:netflix_clone/api/apiFunctions.dart';
import 'package:netflix_clone/models/Movies.dart';

class SearchController extends GetxController {
  late TextEditingController tC;
  bool showCancelButton = false;
  bool isSearching = true;
  bool hasSearched = false;
  List<Movie> resultMovie = [];
  clearSearch() {
    tC.text = '';
    update();
  }

  searchMovie(String query) async {
    hasSearched = true;
    List<Movie>? m = await fetchMovies(Endpoints.movieSearchUrl(query));
    resultMovie = m!;
    print(resultMovie.length);
    isSearching = false;

    update();
  }

  @override
  void onInit() {
    tC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    tC.dispose();
    super.onClose();
  }
}
