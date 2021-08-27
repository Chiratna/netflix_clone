import 'package:get/get.dart';
import 'package:netflix_clone/controllers/GenreMovieControllers.dart';

class GenreMovieBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GenreMovieController>(() => GenreMovieController());
  }
}
