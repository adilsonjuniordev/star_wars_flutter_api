abstract class CharacterRepository {
  Future<List<dynamic>> getCharacters();
  Future<List<dynamic>> getFilteredCharacters(String query);
}
