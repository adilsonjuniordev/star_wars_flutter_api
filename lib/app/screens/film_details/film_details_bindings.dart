import 'package:get/get.dart';
import './film_details_controller.dart';

class FilmDetailsBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(FilmDetailsController());
  }
}
