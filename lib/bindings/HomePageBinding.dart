import 'package:get/get.dart';
import 'package:netflix_clone/controllers/homeController.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
