import 'package:star_wars_w2o/app/models/planet_model.dart';

abstract class PlanetRepository {
  Future<List<PlanetModel>> getPlanet(String url);
}
