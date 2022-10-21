import 'package:get/get.dart';
import '../../models/film_model.dart';

class FilmDetailsController extends GetxController {
  List<dynamic> arguments = Get.arguments;
  var characterName = ''.obs;
  var title = ''.obs;
  var director = ''.obs;
  var releaseDate = ''.obs;
  var producer = ''.obs;

  @override
  void onInit() {
    FilmModel film = arguments[0];
    characterName.value = arguments[1];
    title.value = film.title;
    director.value = film.director;
    releaseDate.value = film.releaseDate;
    producer.value = film.producer;
    super.onInit();
  }
}
