import 'package:get/get.dart';
import '../../models/film_model.dart';

class FilmDetailsController extends GetxController {
  Map args = Get.arguments;
  var characterName = ''.obs;
  var title = ''.obs;
  var director = ''.obs;
  var releaseDate = ''.obs;
  var producer = ''.obs;

  @override
  void onInit() {
    FilmModel film = args['film'];
    characterName.value = args['character_name'];
    title.value = film.title;
    director.value = film.director;
    releaseDate.value = film.releaseDate;
    producer.value = film.producer;
    super.onInit();
  }
}
