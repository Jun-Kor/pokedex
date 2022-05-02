/*
{
  "count": 1126,
  "next": "https://pokeapi.co/api/v2/pokemon?offset=300&limit=100",
  "previous": "https://pokeapi.co/api/v2/pokemon?offset=100&limit=100",
  "results": [
    {
      "name": "unown",
      "url": "https://pokeapi.co/api/v2/pokemon/201/"
    },
    {
      "name": "wobbuffet",
      "url": "https://pokeapi.co/api/v2/pokemon/202/"
    },
    */

class PokemonPageResponse {
  final List<PokemonListing> pokemonListings;
  final bool canLoadNextPage;
  PokemonPageResponse({
    required this.pokemonListings,
    required this.canLoadNextPage,
  });

  factory PokemonPageResponse.fromJson(Map<String, dynamic> json) {
    final canLoadNextPage = json['next'] != null;
    final poketmonlistings = (json['results'] as List)
        .map((listingJson) => PokemonListing.fromJson(listingJson))
        .toList();

    return PokemonPageResponse(
      canLoadNextPage: canLoadNextPage,
      pokemonListings: poketmonlistings,
    );
  }
}

class PokemonListing {
  final int id;
  final String name;

  String get imageUrl =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';

  PokemonListing({
    required this.id,
    required this.name,
  });

  factory PokemonListing.fromJson(Map<String, dynamic> json) {
    final name = json["name"];
    final url = json["url"] as String;
    final id = int.parse(url.split('/')[6]);
    // url을 '/'기준으로 6번째에 있는 것을 가져온다.
    return PokemonListing(name: name, id: id);
  }
}
