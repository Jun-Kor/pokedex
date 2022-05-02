import 'dart:convert';

import 'package:day16_pokedex_app/models/custom_error.dart';
import 'package:day16_pokedex_app/service/pokemon_species_info_response.dart';
import 'package:http/http.dart' as http;

import '../service/pokemon_info_response.dart';
import '../service/pokemon_page_response.dart';

class PokemonRepository {
  final baseUrl = 'pokeapi.co';
  final client = http.Client();

  Future<PokemonPageResponse> getPokemonPage(int pageIndex) async {
    // pokemon?limit=200&offset=400
    try {
      final queryParameters = {
        'limit': '200',
        'offset': (pageIndex * 200).toString(),
      };

      final uri = Uri.https(baseUrl, '/api/v2/pokemon', queryParameters);

      final response = await client.get(uri);

      final json = jsonDecode(response.body);

      return PokemonPageResponse.fromJson(json);
    } catch (e) {
      throw CustomError(errMsg: e.toString());
    }
  }

  Future<PokemonInfoResponse> getPokemonInfo(int pokemonId) async {
    final uri = Uri.https(baseUrl, '/api/v2/pokemon/$pokemonId');
    try {
      final response = await client.get(uri);
      final json = jsonDecode(response.body);
      return PokemonInfoResponse.fromJson(json);
    } catch (e) {
      throw CustomError(errMsg: e.toString());
    }
  }

  Future<PokemonSpeciesInfoResponse> getPokemonSpeciesInfo(
      int pokemonId) async {
    final uri = Uri.https(baseUrl, '/api/v2/pokemon-species/$pokemonId');
    try {
      final response = await client.get(uri);
      final json = jsonDecode(response.body);
      return PokemonSpeciesInfoResponse.fromJson(json);
    } catch (e) {
      throw CustomError(errMsg: e.toString());
    }
  }
}
