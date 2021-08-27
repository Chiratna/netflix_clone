import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:netflix_clone/models/Credits.dart';
import 'package:netflix_clone/models/GenreList.dart';
import 'package:netflix_clone/models/Movies.dart';

import 'apiEndpoints.dart';

Future<List<Movie>?> fetchMovies(String api) async {
  MovieList movieList;
  var res = await http.get(Uri.parse(api));
  var decodeRes = jsonDecode(res.body);
  movieList = MovieList.fromJson(decodeRes);
  return movieList.movies;
}

Future<Credits> fetchCredits(String api) async {
  Credits credits;
  var res = await http.get(Uri.parse(api));
  var decodeRes = jsonDecode(res.body);
  credits = Credits.fromJson(decodeRes);
  return credits;
}

Future<GenresList> fetchGenres() async {
  GenresList genresList;
  var res = await http.get(Uri.parse(Endpoints.genresUrl()));
  var decodeRes = jsonDecode(res.body);
  genresList = GenresList.fromJson(decodeRes);
  return genresList;
}
