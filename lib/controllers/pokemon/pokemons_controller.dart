import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:random_app/constants/pokemon_constant.dart';
import 'package:random_app/models/pokemon/pokemon_model.dart';
import 'package:random_app/models/pokemon/pokemon_result_model.dart';
import 'package:random_app/models/pokemon/pokemon_type_filter_model.dart';
import 'package:random_app/models/pokemon/pokemons_response_model.dart';
import 'package:random_app/services/pokemon/pokemon_service.dart';

class PokemonsController extends GetxController {
  PokemonsController();

  RxBool isLoading = false.obs;
  ScrollController scrollController = ScrollController();
  RxInt tabSelectedId = 0.obs;

  RxString pokemonsUrl = 'https://pokeapi.co/api/v2/pokemon'.obs;
  RxList<Pokemon> tempPokemons = <Pokemon>[].obs;
  RxList<Pokemon> pokemons = <Pokemon>[].obs;

  RxList<PokemonElement> pokemonElements = <PokemonElement>[].obs;
  RxString name = ''.obs;
  RxList<String> elements = <String>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    fetchPokemons();

    PokemonConstant.typeIcon.forEach((key, value) {
      pokemonElements.add(PokemonElement(name: key, iconPath: value));
    });

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
          if (p != null) {
            pokemons.add(p);
            tempPokemons.add(p);
          }
        }
      }
    } catch (e) {
      debugPrint('Error while getting data is $e');
    } finally {
      isLoading(false);
    }
  }

  selectType(int i) {
    pokemonElements[i].isSelected = !pokemonElements[i].isSelected;
    if (pokemonElements[i].isSelected) {
      elements.add(pokemonElements[i].name);
    } else {
      elements.removeWhere((element) => element == pokemonElements[i].name);
    }

    pokemonElements.refresh();
  }

  changeName(String pokemonName) {
    name(pokemonName);
  }

  clearFilter() {
    for (var element in pokemonElements) {
      element.isSelected = false;
    }
    name('');
    elements.clear();
  }

  submitFilter() {
    pokemons(tempPokemons);
    pokemons.value = pokemons.where((pokemon) {
      return pokemon.name.contains(name.value) && elements.isNotEmpty
          ? pokemon.pokemonTypes
              .where((pt) => elements.contains(pt.type.name))
              .isNotEmpty
          : true;
    }).toList();
    pokemons.refresh();
  }
}
