import 'package:get/get.dart';
import 'package:star_wars_w2o/app/models/film_model.dart';

class FilmDetailsController extends GetxController {
  List<dynamic> arguments = Get.arguments;
  RxString characterName = ''.obs;
  RxString title = ''.obs;
  RxString director = ''.obs;
  RxString releaseDate = ''.obs;
  RxString producer = ''.obs;

  @override
  void onInit() {
    characterName.value = arguments[1];
    FilmModel film = arguments[0];

    title.value = film.title;
    director.value = film.director;
    releaseDate.value = film.releaseDate;
    producer.value = film.producer;
    super.onInit();
  }
}
