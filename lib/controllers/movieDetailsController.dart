import 'package:get/get.dart';
import 'package:netflix_clone/api/apiEndpoints.dart';
import 'package:netflix_clone/api/apiFunctions.dart';
import 'package:netflix_clone/models/Credits.dart';
import 'package:netflix_clone/models/GenreList.dart';
import 'package:netflix_clone/models/Movies.dart';

class MovieDetailsController extends GetxController {
  List<Genres> matchedGenres = [];
  List<Genres> allGenres = [];
  bool isFetchingCredits = true;
  Movie? movie;
  Credits? credits;
  getMatchedGenres({required Movie m, required List<Genres> allGenres}) {
    matchedGenres = [];
    for (int id in m.genreIds!) {
      for (Genres g in allGenres) {
        if (g.id == id) {
          // print(id);
          matchedGenres.add(g);
        }
      }
    }
    //print('dff');
    //print(matchedGenres.length);
    // print(m.genreIds!.length);
    // print(allGenres.length);
    // for (Genres g in matchedGenres) {
    //   print(g.name);
    // }
  }

  setMovie(Movie m) {
    movie = m;
    // update();
  }

  setAllGenres(List<Genres> m) {
    //if (allGenres.isEmpty)
    allGenres = m;

    //update();
  }

  getCredits(int movieId) async {
    credits = await fetchCredits(Endpoints.getCreditsUrl(movieId));
    //  print(credits!.cast![0].name);
    isFetchingCredits = false;
    update();
  }
}
