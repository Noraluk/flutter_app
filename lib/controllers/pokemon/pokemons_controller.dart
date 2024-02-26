import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:random_app/models/pokemon/pokemon_model.dart';
import 'package:random_app/models/pokemon/pokemon_result_model.dart';
import 'package:random_app/models/pokemon/pokemons_response_model.dart';
import 'package:random_app/services/pokemon/pokemon_service.dart';

class PokemonsController extends GetxController {
  PokemonsController();

  RxBool isLoading = false.obs;
  ScrollController scrollController = ScrollController();
  RxInt tabSelectedId = 0.obs;

  RxString pokemonsUrl = 'https://pokeapi.co/api/v2/pokemon'.obs;
  List<Pokemon> pokemons = <Pokemon>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    fetchPokemons();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        fetchPokemons();
      }
    });
  }

  setTabSelectedId(int id) => tabSelectedId(id);

  fetchPokemons() async {
    try {
      isLoading(true);
      PokemonsResponse? response =
          await PokemonService.fetchPokemons(pokemonsUrl.value);
      if (response != null && response.pokemons.isNotEmpty) {
        pokemonsUrl(response.next);
        for (PokemonResult result in response.pokemons) {
          Pokemon? p = await PokemonService.fetchPokemon(result.name);
          if (p != null) pokemons.add(p);
        }
      }
    } catch (e) {
      log('Error while getting data is $e');
    } finally {
      isLoading(false);
    }
  }
}
