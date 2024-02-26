import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:random_app/models/pokemon/pokemon_characteristic_response_model.dart';
import 'package:random_app/models/pokemon/pokemon_evolution_chain_response_model.dart';
import 'package:random_app/models/pokemon/pokemon_model.dart';
import 'package:random_app/models/pokemon/pokemon_move_response_model.dart';
import 'package:random_app/models/pokemon/pokemon_species_response._model.dart';
import 'package:random_app/models/pokemon/pokemons_response_model.dart';

class PokemonService {
  static http.Client client = http.Client();

  static Future<PokemonsResponse?> fetchPokemons(String url) async {
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return PokemonsResponse.fromJson(
            jsonDecode(response.body) as Map<String, dynamic>);
      } else {
        throw Exception('Failed to load pokemons');
      }
    } catch (e) {
      log('Failed to load pokemons $e');
    }
    return null;
  }

  static Future<Pokemon?> fetchPokemon(String name) async {
    try {
      http.Response response =
          await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$name'));
      if (response.statusCode == 200) {
        return Pokemon.fromJson(
            jsonDecode(response.body) as Map<String, dynamic>);
      } else {
        throw Exception('Failed to load pokemon');
      }
    } catch (e) {
      log('Failed to load pokemon $e');
    }
    return null;
  }

  static Future<PokemonCharacteristicResponse?> fetchPokemonCharacteristic(
    int id,
  ) async {
    try {
      http.Response response = await http
          .get(Uri.parse('https://pokeapi.co/api/v2/characteristic/$id'));
      if (response.statusCode == 200) {
        return PokemonCharacteristicResponse.fromJson(
            jsonDecode(response.body) as Map<String, dynamic>);
      } else {
        throw Exception('Failed to load');
      }
    } catch (e) {
      log('Failed to load $e');
    }
    return null;
  }

  static Future<PokemonSpeciesResponse?> fetchPokemonSpecies(
    int id,
  ) async {
    try {
      http.Response response = await http
          .get(Uri.parse('https://pokeapi.co/api/v2/pokemon-species/$id'));
      if (response.statusCode == 200) {
        return PokemonSpeciesResponse.fromJson(
            jsonDecode(response.body) as Map<String, dynamic>);
      } else {
        throw Exception('Failed to load');
      }
    } catch (e) {
      log('Failed to load $e');
    }
    return null;
  }

  static Future<PokemonEvolutionChainResponse?> fetchPokemonEvolutionChain(
    String url,
  ) async {
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return PokemonEvolutionChainResponse.fromJson(
            jsonDecode(response.body) as Map<String, dynamic>);
      } else {
        throw Exception('Failed to load');
      }
    } catch (e) {
      log('Failed to load $e');
    }
    return null;
  }

  static Future<PokemonMoveResponse?> fetchPokemonMove(
    String url,
  ) async {
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return PokemonMoveResponse.fromJson(
            jsonDecode(response.body) as Map<String, dynamic>);
      } else {
        throw Exception('Failed to load');
      }
    } catch (e) {
      log('Failed to load $e');
    }
    return null;
  }
}
