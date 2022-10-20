import 'package:star_wars_w2o/app/models/starship_model.dart';

abstract class StarshipRepository {
  Future<List<StarshipModel>> getStarship(String url);
}
