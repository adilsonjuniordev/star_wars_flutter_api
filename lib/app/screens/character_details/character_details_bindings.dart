import 'package:get/get.dart';
import 'package:star_wars_w2o/app/repository/film_repository/film_repository.dart';
import 'package:star_wars_w2o/app/repository/film_repository/film_repository_impl.dart';
import 'package:star_wars_w2o/app/repository/planet_repository/planet_repository.dart';
import 'package:star_wars_w2o/app/repository/planet_repository/planet_repository_impl.dart';
import 'package:star_wars_w2o/app/repository/starship_repository/starship_repository.dart';
import 'package:star_wars_w2o/app/repository/starship_repository/starship_repository_impl.dart';
import './character_details_controller.dart';

class CharacterDetailsBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<PlanetRepository>(PlanetRepositoryImpl(dio: Get.find(tag: 'dio')));
    Get.put<StarshipRepository>(StarshipRepositoryImpl(dio: Get.find(tag: 'dio')));
    Get.put<FilmRepository>(FilmRepositoryImpl(dio: Get.find(tag: 'dio')));
    Get.put(CharacterDetailsController());
  }
}
