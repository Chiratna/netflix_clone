import 'package:get/get.dart';
import 'package:netflix_clone/controllers/SearchController.dart';

class SearchPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchController>(() => SearchController(), fenix: true);
  }
}
