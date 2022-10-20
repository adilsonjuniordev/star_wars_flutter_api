import 'package:get/get.dart';
import 'package:star_wars_w2o/app/models/character_model.dart';
import 'package:star_wars_w2o/app/models/planet_model.dart';
import 'package:star_wars_w2o/app/models/starship_model.dart';
import 'package:star_wars_w2o/app/repository/planet_repository/planet_repository_impl.dart';
import 'package:star_wars_w2o/app/repository/starship_repository/starship_repository_impl.dart';

class CharacterDetailsController extends GetxController with StateMixin {
  final CharacterModel arguments = Get.arguments;
  final planetRepository = PlanetRepositoryImpl(dio: Get.find());
  final starshipRepository = StarshipRepositoryImpl(dio: Get.find());
  List<PlanetModel> planets = [];
  List<StarshipModel> starships = [];

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

  Future<void> getPlanet() async {
    planets.addAll(await planetRepository.getPlanet(arguments.homeworld));
  }

  Future<void> getStarship() async {
    if (arguments.starships.isNotEmpty) {
      starships.addAll(await starshipRepository.getStarship(arguments.starships.first));
    }
  }
}
