import 'package:get/get.dart';
import 'package:star_wars_w2o/app/repository/film_repository/film_repository.dart';
import 'package:star_wars_w2o/app/repository/planet_repository/planet_repository.dart';
import 'package:star_wars_w2o/app/repository/starship_repository/starship_repository.dart';
import '../../models/planet_model.dart';
import '../../models/character_model.dart';
import '../../models/film_model.dart';
import '../../models/starship_model.dart';

class CharacterDetailsController extends GetxController with StateMixin {
  final CharacterModel args = Get.arguments;
  final _planetRepository = Get.find<PlanetRepository>();
  final _starshipRepository = Get.find<StarshipRepository>();
  final _filmRepository = Get.find<FilmRepository>();

  List<PlanetModel> planets = [];
  List<StarshipModel> starships = [];
  var viewType = true.obs;
  var films = <FilmModel>[].obs;
  var name = ''.obs;
  var gender = ''.obs;
  var birthYear = ''.obs;
  var homeworld = ''.obs;
  var terrain = ''.obs;
  var diameter = ''.obs;
  var starship = ''.obs;

  @override
  void onInit() async {
    change(null, status: RxStatus.loading());
    await getPlanet();
    await getStarship();
    await getFilms();
    name.value = args.name;
    gender.value = args.gender;
    birthYear.value = args.birthYear;
    starship.value = starships.isNotEmpty ? starships.first.name : 'N/A';
    homeworld.value = planets.first.name;
    terrain.value = planets.first.terrain;
    diameter.value = planets.first.diameter;
    change(null, status: RxStatus.success());
    super.onInit();
  }

  Future<void> getPlanet() async => planets.addAll(await _planetRepository.getPlanet(args.homeworld));

  Future<void> getStarship() async {
    if (args.starships.isNotEmpty) {
      starships.addAll(await _starshipRepository.getStarship(args.starships.first));
    }
  }

  Future<void> getFilms() async => films.addAll(await _filmRepository.getFilms(args.films));
}
