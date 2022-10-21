import 'package:get/get.dart';
import 'package:star_wars_w2o/app/repository/film_repository/film_repository.dart';
import 'package:star_wars_w2o/app/repository/planet_repository/planet_repository.dart';
import 'package:star_wars_w2o/app/repository/starship_repository/starship_repository.dart';
import '../../models/planet_model.dart';
import '../../models/character_model.dart';
import '../../models/film_model.dart';
import '../../models/starship_model.dart';

class CharacterDetailsController extends GetxController with StateMixin {
  final CharacterModel arguments = Get.arguments;
  final _planetRepository = Get.find<PlanetRepository>();
  final _starshipRepository = Get.find<StarshipRepository>();
  final _filmRepository = Get.find<FilmRepository>();

  RxBool viewType = true.obs;
  List<PlanetModel> planets = [];
  List<StarshipModel> starships = [];
  RxList<FilmModel> films = <FilmModel>[].obs;

  RxString name = ''.obs;
  RxString gender = ''.obs;
  RxString birthYear = ''.obs;
  RxString homeworld = ''.obs;
  RxString terrain = ''.obs;
  RxString diameter = ''.obs;
  RxString starship = ''.obs;

  @override
  void onInit() async {
    change(null, status: RxStatus.loading());
    await getPlanet();
    await getStarship();
    await getFilms();
    name.value = arguments.name;
    gender.value = arguments.gender;
    birthYear.value = arguments.birthYear;
    starship.value = starships.isNotEmpty ? starships.first.name : 'N/A';
    homeworld.value = planets.first.name;
    terrain.value = planets.first.terrain;
    diameter.value = planets.first.diameter;
    change(null, status: RxStatus.success());
    super.onInit();
  }

  Future<void> getPlanet() async => planets.addAll(await _planetRepository.getPlanet(arguments.homeworld));

  Future<void> getStarship() async {
    if (arguments.starships.isNotEmpty) {
      starships.addAll(await _starshipRepository.getStarship(arguments.starships.first));
    }
  }

  Future<void> getFilms() async => films.addAll(await _filmRepository.getFilms(arguments.films));
}
