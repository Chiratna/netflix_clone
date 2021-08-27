import 'package:get/get.dart';
import 'package:netflix_clone/api/apiEndpoints.dart';
import 'package:netflix_clone/api/apiFunctions.dart';
import 'package:netflix_clone/constants/typeConstant.dart';
import 'package:netflix_clone/models/GenreList.dart';
import 'package:netflix_clone/models/Movies.dart';

class HomeController extends GetxController {
  Mode activeMode = Mode.MOVIES;
  int count = 0;
  bool isFetchingNowPlayingMovies = true;
  bool isFetchingPopularMovies = true;
  bool isFetchingDiscoverMovies = true;
  bool isFetchingGenres = true;
  bool isFetchingTopRatedMovie = true;
  bool inHomeScreen = true;
  List<Movie> nowPlayingMovieList = [];
  List<Movie> popularMoviesList = [];
  List<Movie> discoverMovieList = [];
  List<Movie> topRatedMovieList = [];
  List<Genres> genreList = [];

  @override
  void onInit() {
    getNowPlayingMovieList();
    getPopularMovies();
    getDiscoverMoviesList();
    getTopRatedMovies();
    getGenres();
    super.onInit();
  }

  toggleHomeScreenState(bool value) {
    inHomeScreen = value;
    update();
  }

  getGenres() async {
    GenresList g = await fetchGenres();
    if (g.genres != null) {
      genreList = g.genres!;
    }
    isFetchingGenres = false;
    update();
    print(genreList);
  }

  getNowPlayingMovieList() async {
    List<Movie>? v = await fetchMovies(Endpoints.nowPlayingMoviesUrl(1));
    // print(v!.length);
    if (v != null) {
      nowPlayingMovieList = v;
    } else {
      nowPlayingMovieList = [];
    }
    isFetchingNowPlayingMovies = false;
    update();
  }

  getTopRatedMovies() async {
    List<Movie>? v = await fetchMovies(Endpoints.topRatedUrl(1));
    // print(v!.length);
    if (v != null) {
      topRatedMovieList = v;
    } else {
      topRatedMovieList = [];
    }
    isFetchingTopRatedMovie = false;
    update();
  }

  getPopularMovies() async {
    List<Movie>? v = await fetchMovies(Endpoints.popularMoviesUrl(1));
    //print(v!.length);
    if (v != null) {
      popularMoviesList = v;
    } else {
      popularMoviesList = [];
    }
    isFetchingPopularMovies = false;
    update();
  }

  getDiscoverMoviesList() async {
    List<Movie>? v = await fetchMovies(Endpoints.discoverMoviesUrl(1));
    //print(v!.length);
    if (v != null) {
      discoverMovieList = v;
    } else {
      discoverMovieList = [];
    }
    isFetchingDiscoverMovies = false;
    update();
  }

  setModeToTV() {
    activeMode = Mode.TV_SHOWS;
    update();
  }

  setModeToMyList() {
    activeMode = Mode.MY_LIST;
    update();
  }

  setModeToMovies() {
    activeMode = Mode.MOVIES;
    update();
  }
}
