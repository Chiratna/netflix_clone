import 'package:get/get.dart';
import 'package:netflix_clone/controllers/movieDetailsController.dart';

class MovieDetailsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieDetailsController>(
      () => MovieDetailsController(),
    );
  }
}
