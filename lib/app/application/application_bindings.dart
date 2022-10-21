import 'package:get/get.dart';
import 'package:star_wars_w2o/app/core/api/custom_dio.dart';
import 'package:star_wars_w2o/app/repository/character_repository/character_repository.dart';
import 'package:star_wars_w2o/app/repository/character_repository/character_repository_impl.dart';
import 'package:star_wars_w2o/app/repository/film_repository/film_repository.dart';
import 'package:star_wars_w2o/app/repository/film_repository/film_repository_impl.dart';
import 'package:star_wars_w2o/app/repository/planet_repository/planet_repository.dart';
import 'package:star_wars_w2o/app/repository/planet_repository/planet_repository_impl.dart';
import 'package:star_wars_w2o/app/repository/starship_repository/starship_repository.dart';
import 'package:star_wars_w2o/app/repository/starship_repository/starship_repository_impl.dart';

import '../core/config/env/env.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(CustomDio(Env.i['backend_base_url']), permanent: true);
    Get.put(CustomDio(), tag: 'dio', permanent: true);
    Get.put<CharacterRepository>(CharacterRepositoryImpl(dio: Get.find()), permanent: true);
    Get.put<PlanetRepository>(PlanetRepositoryImpl(dio: Get.find()), permanent: true);
    Get.put<StarshipRepository>(StarshipRepositoryImpl(dio: Get.find()), permanent: true);
    Get.put<FilmRepository>(FilmRepositoryImpl(dio: Get.find()), permanent: true);
  }
}
