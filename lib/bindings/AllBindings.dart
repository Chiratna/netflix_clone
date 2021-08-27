import 'package:get/get.dart';
import 'package:netflix_clone/controllers/homeController.dart';
import 'package:netflix_clone/controllers/movieDetailsController.dart';

class AllBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<MovieDetailsController>(() => MovieDetailsController(),
        fenix: true);
  }
}
