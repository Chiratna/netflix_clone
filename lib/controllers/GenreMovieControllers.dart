import 'package:get/get.dart';
import 'package:netflix_clone/api/apiEndpoints.dart';
import 'package:netflix_clone/api/apiFunctions.dart';
import 'package:netflix_clone/models/GenreList.dart';
import 'package:netflix_clone/models/Movies.dart';

class GenreMovieController extends GetxController {
  List<Movie> resultMovie = [];
  bool isFetchingMovies = true;
  Genres? genre;
  List<Genres> allGenres = [];

  setGenre(Genres g) {
    genre = g;
  }

  setAllGenres(List<Genres> m) {
    if (allGenres.isEmpty) {
      allGenres = m;
    }
  }

  fetchGenreMovies() async {
    List<Movie>? v =
        await fetchMovies(Endpoints.getMoviesForGenre(genre!.id!, 1));
    if (v != null)
      resultMovie = v;
    else
      resultMovie = [];
    isFetchingMovies = false;
    update();
  }
}
